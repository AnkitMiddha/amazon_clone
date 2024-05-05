
const mongoose = require('mongoose');
const Schema = mongoose.Schema;
 const userSchema = mongoose.Schema(
    {
        name: {
            
            type: String,
            required : true,
           // required : true,
            trim: true,

        },
        email: {
          
            type: String,
            required : true,
          //  required : true,
            trim:true,
            validate : {validator : (value) =>  {
              const re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
              return value.match(re);
            },
            message: "Please Enter a valid Email Address",
        }

        },
         password : {
            
            type: String,
            
            trim: true ,
           required : true,
           
        //     validate : { 
        //      validator:(value) => {
        //            const ri = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
        //            return value.match(ri);
        //         },
        //          message: "The Password must contain Minimum eight characters, at least one uppercase letter, one lowercase letter and one number:",
           
        //  },  
       },
            address: {
                type: String,
                default :''
            },
            type : {
                type : String,
                default: "user",
            },
            

        
    }
    //cart
 );
 const User = mongoose.model('User',userSchema);
 module.exports = User;