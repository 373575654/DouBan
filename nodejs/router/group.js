const pool=require("../pool");
const express=require("express");
let router=express.Router();
router.get("/group",(req,res)=>{
  let output={"data":[]};
  pool.getConnection((err,conn)=>{
    if(err){throw err}
    var sql="select src,title,count from db_hot_group";
    conn.query(sql,(err,result)=>{
      if(err){throw err;}
      if(result.length > 0){
        output.data=result;
        res.json(output);
      }else{
        res.json({code: -1, msg: "获取失败！"});
      }
    });
  });
});
module.exports=router;
