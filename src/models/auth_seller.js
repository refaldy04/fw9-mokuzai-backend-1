const db = require('../helpers/db.js');


exports.createRegister = (data,cb) =>{
  db.query('BEGIN', err=>{
    if(err){
      console.log(err);
      cb(err);}
    else{
      const queryUserSeller = 'INSERT INTO users (email, password, roles) VALUES ($1, $2, $3) RETURNING*';
      const valUser = [data.email, data.password, data.roles];
      db.query(queryUserSeller,valUser,(err,res)=>{
        console.log(res);
        if(err){
          cb(err);
        }else{
          const queryProfileCostumer = 'INSERT INTO profile (user_id) VALUES ($1)';
          const valProfile = [res.rows[0].id];
          db.query(queryProfileCostumer,valProfile,(err)=>{
            if(err){
              cb(err);
            }else{
              cb(err,res);
              db.query('COMMIT',err=>{
                if(err){
                  console.log(err);
                }
              });
            }
          });
        }
      });
    }
  });
};

exports.getUserByEmail = (email, cb) => {
  const quer = 'SELECT * FROM users WHERE email=$1';
  const value = [email];
  db.query(quer, value, (err, res)=>{
    cb(err, res);
  });
};


