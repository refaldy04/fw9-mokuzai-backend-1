const db = require('../helpers/db.js');


exports.createRegister = (data,cb) =>{
  const que='INSERT INTO user (email, password, roles) VALUES ($1,$2,$3) RETURNING*';
  const val=[data.email, data.password ,data.roles];
  db.query(que,val,(err,res)=>{
    console.log(err);
    if(err){
      cb(err);
    }else{
      cb(err,res);
    }
  });
};


