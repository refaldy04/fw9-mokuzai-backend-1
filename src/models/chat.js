const db = require('../helpers/db');

exports.costumerChat=(costumer,data,cb)=>{
  const que='INSERT INTO chat (costumer_id,seller_id,chat) VALUES ($1,$2,$3) RETURNING*';
  const val=[costumer,data.seller_id,data.chat];
  db.query(que,val,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res);
    }
  });
};

exports.sellerChat=(seller,data,cb)=>{
  const que='INSERT INTO chat (seller_id,costumer_id,chat) VALUES ($1,$2,$3) RETURNING*';
  const val=[seller,data.costumer_id,data.chat];
  db.query(que,val,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res);
    }
  });
};

exports.getHistoryChat=(id,cb)=>{
  const que=`SELECT * FROM chat
  LEFT JOIN users
  ON users.id = chat.seller_id 
  LEFT JOIN profile
  ON profile.id = chat.costumer_id WHERE chat.seller_id=${id} OR chat.costumer_id=${id}`;
  db.query(que,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res);
    }
  });
};


exports.deleteChat=(id,cb)=>{
  const que=`DELETE FROM chat WHERE id=${id} RETURNING*`;
  db.query(que,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res);
    }
  });
};