const pool=require("../pool");
const express=require("express");
let router=express.Router();
router.get("/movie",(req,res)=>{
  let output={
    "movies":[],
    "hot":[]
  };
  pool.getConnection((err,conn)=>{
    if(err){throw err}
    var sql="select src,name,rate,star from db_movie";
    conn.query(sql,(err,result)=>{
      if(err){throw err;}
      if(result.length > 0){
        output.movies=result;
      }
    });
    var sql1="select name from db_hot_movie order by score DESC";
    conn.query(sql1,(err,result)=>{
        if(err){throw err;}
        if(result.length>0){
            output.hot=result;
            res.json(output);
        }else{
            res.json({code: -1, msg: "获取失败！"});
        }
      })
    });
  });
module.exports=router;
