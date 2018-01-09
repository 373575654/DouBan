const pool=require("../pool");
const express=require("express");
let router=express.Router();
router.get('/login/:account/:upwd',(req,res)=>{
  let account=req.params.account;
  let upwd=req.params.upwd;
  pool.getConnection((err,conn)=>{
    if(err){throw err;}
    var sql="select uid from db_user where nickname=? or email=? or phone=? and upwd=?";
    conn.query(sql,[account,account,account,upwd],(err,result)=>{
      if(err){throw err;}
      if(result.length > 0){
        res.json({code: 1, msg: "登录成功！"});
      }else{
        res.json({code: -1, msg: "登录失败！"});
      }
      conn.release();
    });
  });
});
module.exports=router;
