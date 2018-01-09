const pool=require("../pool");
const express=require("express");
let router=express.Router();
router.get("/albums",(req,res)=>{
    console.log(1);
    let output={
        "news":[],
        "news_demo":[],
        "topic":[]
    };
    pool.getConnection((err,conn)=>{
        if(err){throw err;}
        var sql="select src,des,count from db_news";
        conn.query(sql,(err,result)=>{
            if(err){throw err;}
            if(result.length > 0){
                output.news=result;
            }
        });
        var sql1="select title,author,subtitle from db_news_demo";
        conn.query(sql1,(err,result)=>{
            if(err){throw err;}
            if(result.length > 0){
                output.news_demo=result;
            }
        });
        var sql2="select topic,people from db_topic";
        conn.query(sql2,(err,result)=>{
            if(err){throw err;}
            if(result.length>0){
                output.topic=result;
                res.json(output);
            }else{
              res.json({code: -1, msg: "获取失败！"});
            }
        });
    });
});
module.exports=router;
