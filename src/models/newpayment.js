const db = require ('../helpers/db');

exports.createPayment = (user_id, status, data, cb)=>{
  //console.log(data);
  let value = [];
  const filter = {};
  const obj = {
    name: data.name,
    address: data.address,
    phone: data.phone,
    metode_trans: data.metode_trans,
    shipping: data.shipping,
    total: data.total,
    status,
    user_id 
  };
  for(let x in obj){
    if(obj[x]!==null){
      if(obj[x]!==undefined){
        filter[x] = obj[x];
        value.push(obj[x]);
      }
    }
  }
  
  const key = Object.keys(filter);
  const finalRes = key.map((o, ind) => `$${ind+1}`);
  const quer = `INSERT INTO payment_new (${key}) VALUES (${finalRes}) RETURNING *`;
  console.log(value);
  db.query(quer, value, (err, res)=>{
    if(err) {
      throw err;
    }
    cb(err, res.rows);
  }) ;
};

exports.editPayment = (user_id, id, status, data, cb)=>{
  let value = [id];
  const filter = {};
  const obj = {
    name: data.name,
    address: data.address,
    phone: data.phone,
    metode_trans: data.metode_trans,
    shipping: data.shipping,
    total: data.total,
    status,
    user_id  
  };
  for(let x in obj){
    if(obj[x]!==null){
      if(obj[x]!==undefined){
        filter[x] = obj[x];
        value.push(obj[x]);
      }
    }
  }
  
  const key = Object.keys(filter);
  const finalRes = key.map((o, ind) => `${o}=$${ind+2}`);
  const quer = `UPDATE payment_new SET ${finalRes} WHERE id=$1 RETURNING *`;
  db.query(quer, value, (err, res)=>{
    // console.log(value);
    //console.log(res.rows);
    if(err) {
      cb(err);
    }else{
      cb(err, res.rows);
    }
  }) ;
};
  
exports.editStatus = (user_id, id, data, cb)=>{
  let value = [id];
  const filter = {};
  const obj = {
    status: data.status,  
  };
  for(let x in obj){
    if(obj[x]!==null){
      if(obj[x]!==undefined){
        filter[x] = obj[x];
        value.push(obj[x]);
      }
    }
  }
  
  const key = Object.keys(filter);
  const finalRes = key.map((o, ind) => `${o}=$${ind+2}`);
  const quer = `UPDATE payment_new SET ${finalRes} WHERE id=$1 RETURNING *`;
  db.query(quer, value, (err, res)=>{
    // console.log(value);
    //console.log(res.rows);
    if(err) {
      cb(err);
    }else{
      cb(err, res.rows);
    }
  }) ;
};
  