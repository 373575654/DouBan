const pool=require("../pool");
const express=require("express");
let router=express.Router();
router.post('/phone',(req,res)=>{
  let phone=req.body.phone;
  pool.getConnection((err,conn)=>{
    if(err){throw err;}
    var sql="select uid from db_user where phone=?";
    conn.query(sql,[phone],(err,result)=>{
      if(err){throw err;}
      if(result.length>0){
        res.json({code:-1,msg:"手机号已注册！"});

      }else{
        res.json({code:1,msg:"手机号可以使用！"});
      }
      conn.release();
    });
  });
});
module.exports=router;
