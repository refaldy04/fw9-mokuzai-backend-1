const db = require ('../helpers/db');

exports.getAllProfile = (cb) => {
  const q = 'SELECT * FROM profile';
  db.query(q, (err, res) =>{
    return cb(err, res.rows);
  });
};

exports.getProfilebyId = (id, cb) =>{
  const q = 'SELECT * FROM profile WHERE id=$1';
  const val = [id];
  db.query(q, val, (err, res)=>{
    return cb(err, res);
  });
};

exports.createProfiles = (data, picture, cb)=>{
  let val=[];
  const filtered = {};
  const obj = {
    picture,
    gender: data.gender,
    name: data.name,
    store_name: data.store_name,
    store_desc: data.store_desc,
  };

  for(let x in obj){
    if(obj[x]!==null){
      filtered[x] = obj [x];
      val.push(obj[x]);
    }
  }

  const key = Object.keys(filtered);
  const strKey = key.join();
  const finalResult = key.map((o, ind) => `$${ind+1}`);

  const q = `INSERT INTO profile (${strKey}) VALUES (${finalResult}) RETURNING *`;
  db.query(q, val, (err,res)=>{
    if (res) {
      cb(err, res);
    }else{
      cb(err);
    }
  });
};

exports.updateProfiles = (id, picture, data, cb)=>{
  let val = [id];

  const filtered = {};
  const obj = {
    picture,
    name: data.name,
    gender: data.gender,
    store_name: data.store_name,
    store_desc: data.store_desc,
  };

  for(let x in obj){
    if(obj[x]!==null){
      filtered[x] = obj [x];
      val.push(obj[x]);
    }
  }

  const key = Object.keys(filtered);
  const finalResult = key.map((o, ind) => `${o}=$${ind+2}`);

  const q = `UPDATE profile SET ${finalResult} WHERE id=$1 RETURNING *`;
  db.query(q, val, (err,res)=>{
    console.log(res);
    cb(err, res);
  });
};

exports.createProfileAfterRegister = (data, cb) => {
  const query = 'INSERT INTO profile(user_id) VALUES($1) RETURNING *';
  const values = [data];
  db.query(query, values, (err, res) => {
    if (err) {
      cb(err);
    } else {
      cb(err, res.rows);
    }
  });
};
