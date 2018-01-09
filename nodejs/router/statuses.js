const pool=require("../pool");
const express=require("express");
let router=express.Router();
router.get("/status",(req,res)=>{
  let output={"data":[]};
  pool.getConnection((err,conn)=>{
    if(err){throw err;}
    var sql="select src,`title`,`desc`,`user`,`avatar`,`time` from db_statuses";
    conn.query(sql,(err,result)=>{
      if(err){throw err;}
      if(result.length > 0){
        output.data=result;
        res.json(output);
      }else{
        res.json({code: -1, msg: "获取失败！"});
      }
      conn.release();
    });
  });
});
module.exports=router;
