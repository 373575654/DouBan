const mysql=require("mysql");
let pool = mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    database:"douban",
    password:"",
    port:3306,
    connectionLimit:25
});
module.exports=pool;