console.log("Hello World");
// print "Hello World"
const express = require("express");
const mongoose = require ("mongoose");
const authRouter = require('./auth');
const cors = require("cors");

// import package express 
const PORT = 3000;
const app =express();
app.use(cors());
const DB = "mongodb+srv://ankit9828:ankit123@cluster0.lfxmn10.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
mongoose.connect(DB).then(
     () => {
        console.log("Connection Sucessful");
     }
).catch((e)=> {
  console.log(e);
});
  // middleware 
    app.use(express.json());
    app.use(authRouter);
// GET POST PUT DELETE UPDATE -> CRUD
app.listen(PORT ,"0.0.0.0",  () => {
    console.log(`connected at port ${PORT}`);
});