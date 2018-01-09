const pool=require("../pool");
const express=require("express");
let router=express.Router();
router.post('/register',(req,res)=>{
  let email=req.body.email;
  let upwd=req.body.upwd;
  let nickname=req.body.nickname;
  let phone=req.body.phone;
  pool.getConnection((err,conn)=>{
    if(err){throw err;}
    var sql="insert into db_user values(null,?,?,?,?)";
    conn.query(sql,[phone,upwd,email,nickname],(err,result)=>{
      if(err){throw err;}
      if(result.affectedRows>0){
        res.json({code:1,msg:"注册成功！"});

      }else{
        res.json({code:-1,msg:"注册失败！"});
      }
      conn.release();
    });
  });
});
module.exports=router;
