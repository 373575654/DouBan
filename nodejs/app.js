const http=require("http");
const express=require("express");
const mysql=require("mysql");
const cookieParser=require("cookie-parser");
const session=require("express-session");
const bodyParser=require("body-parser");
const cors=require("cors");

//加载指定路由模块
const routerNews=require("./router/news");
const routerTime=require("./router/time");
const routerVideo=require("./router/video");
const routerMovie=require("./router/movie");
const routerGroup=require("./router/group");
const routerLogin=require("./router/login");
const routerRegister=require("./router/register");
const routerPhone=require("./router/checkphone");
const routerStatus=require("./router/statuses");
const routerEvents=require("./router/events");

let app=express();
let server=http.createServer(app);
server.listen(3002);

app.use(bodyParser.urlencoded({extended:false}));
app.use(cookieParser());
app.use(session({
    resave:false,
    saveUninitialized:true,
    secret:"douban"
}));
app.use(cors({
    origin:["http://127.0.0.1","http://localhost:8082"],
    credentials:true
}));

app.use("/news",routerNews);
app.use("/time",routerTime);
app.use("/video",routerVideo);
app.use("/movie",routerMovie);
app.use("/group",routerGroup);
app.use("/login",routerLogin);
app.use("/register",routerRegister);
app.use("/phone",routerPhone);
app.use("/status",routerStatus);
app.use("/events",routerEvents);