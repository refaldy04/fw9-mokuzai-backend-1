const db = require('../helpers/db');
const {LIMIT_DATA} = process.env;

exports.createProduct = (data, picture1, picture2, picture3, picture4, user_id, category_id, cb) => {
  console.log('aaaaaaaa');
  console.log(user_id);
  let value = [];
  const filter = {};
  const obj = {
    user_id,
    category_id,
    product_name: data.product_name, 
    product_desc: data.product_desc, 
    product_price: data.product_price, 
    product_stock: data.product_stock, 
    product_condition: data.product_condition, 
    picture1, 
    picture2,
    picture3,
    picture4, 

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
  const quer = `INSERT INTO product_details (${key}) VALUES (${finalRes}) RETURNING *`;
  console.log(value);
  db.query(quer, value, (err, res)=>{
    if(err) {
      throw err;
    }
    cb(err, res.rows);
  }) ;
};

exports.showAllProduct=(searchBy,keyword,orderBy,order,limit=parseInt(LIMIT_DATA), offset=0,cb)=>{
  const que = `SELECT 
  product_name,
  product_desc,
  product_price,
  product_stock,
  product_condition,
  picture1,
  picture2,
  picture3,
  picture4, archive_status, category_name FROM product_details  INNER JOIN category  ON product_details.category_id  = category.id WHERE ${searchBy} LIKE '%${keyword}%' ORDER BY ${orderBy} ${order} LIMIT $1 OFFSET $2`;
  const val = [limit,offset];
  console.log(val);
  db.query(que,val,(err,res)=>{
    // console.log(err);
    if(err){
      cb(err);
    }else{
      cb(err,res);
    }
  });
};

exports.countAllProduct=(searchBy,keyword,cb)=>{
  const que = `SELECT product_name,
  product_desc,
  product_price,
  product_stock,
  product_condition,
  picture1,
  picture2,
  picture3,
  picture4, archive_status, category_name FROM product_details  INNER JOIN category  ON product_details.category_id  = category.id WHERE ${searchBy} LIKE ${keyword}`;
  db.query(que,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res.rowCount);
    }
  });
};

exports.editProduct = (id, user_id,data,picture1, picture2, picture3, picture4, cb) =>{
  let value = [id];
  const filtered = {};
  const obj = {
    archive_status: data.archive_status,
    product_name: data.product_name,
    product_desc: data.product_desc,
    product_price: data.product_price,
    product_stock: data.product_stock,
    product_condition: data.product_condition,
    user_id,
    picture1,
    picture2,
    picture3,
    picture4,
  };
  for(let i in obj){
    if(obj[i]!==null){
      if(obj[i]!==undefined){
        filtered[i]=obj[i];
        value.push(obj[i]);
      }
    }
  }
  const key = Object.keys(filtered);
  const finallres = key.map((o,index)=>`${o}=$${index+2}`);
  const que = `UPDATE product_details SET ${finallres} WHERE id=$1 RETURNING*`;
  db.query(que,value,(err, res)=>{
    if(res){
      cb(err, res);
    }else{
      cb(err);
    }
  });
};


exports.archiveProduct = (id, user_id,data,picture1, picture2, picture3, picture4, cb) =>{
  let value = [id];
  const filtered = {};
  const obj = {
    archive_status: data.archive_status,
    product_name: data.product_name,
    product_desc: data.product_desc,
    product_price: data.product_price,
    product_stock: data.product_stock,
    product_condition: data.product_condition,
    user_id,
    picture1,
    picture2,
    picture3,
    picture4,
  };
  for(let i in obj){
    if(obj[i]!==null){
      if(obj[i]!==undefined){
        filtered[i]=obj[i];
        value.push(obj[i]);
      }
    }
  }
  const key = Object.keys(filtered);
  const finallres = key.map((o,index)=>`${o}=$${index+2}`);
  const que = `UPDATE product_details SET ${finallres} WHERE id=$1 RETURNING*`;
  db.query(que,value,(err, res)=>{
    if(res){
      cb(err, res);
    }else{
      cb(err);
    }
  });
};


exports.deleteProduct = (id, cb) => {
  const quer = 'DELETE FROM product_details WHERE id=$1 RETURNING *';
  const value = [id];
  db.query(quer, value, (err, res)=>{
    if(err) {
      cb(err);
    }
    cb(err, res.rows);
  });
};

exports.showProductSeller=(id,searchBy,keyword,orderBy,order,limit=parseInt(LIMIT_DATA), offset=0,cb)=>{
  const que = `SELECT product_name,
  product_desc,
  product_price,
  product_stock,
  product_condition,
  picture1,
  picture2,
  picture3,
  picture4, category_name FROM product_details  INNER JOIN category  ON product_details.category_id  = category.id WHERE ${searchBy} LIKE '%${keyword}%' AND user_id=${id} ORDER BY ${orderBy} ${order} LIMIT $1 OFFSET $2`;
  const val = [limit,offset];
  db.query(que,val,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res);
    }
  });
};

exports.countshowProductSeller=(id,searchBy,keyword,cb)=>{
  const que = `SELECT product_name,
  product_desc,
  product_price,
  product_stock,
  product_condition,
  picture1,
  picture2,
  picture3,
  picture4, category_name FROM product_details  INNER JOIN category  ON product_details.category_id  = category.id WHERE ${searchBy} LIKE ${keyword} AND user_id=${id}`;
  db.query(que,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res.rowCount);
    }
  });
};

exports.showProductByCategory=(category_name,searchBy,keyword,orderBy,order,limit=parseInt(LIMIT_DATA), offset=0,cb)=>{

  const que = `SELECT product_name,
  product_desc,
  product_price,
  product_stock,
  product_condition,
  picture1,
  picture2,
  picture3,
  picture4, category_name FROM product_details  INNER JOIN category   ON product_details.category_id  = category.id WHERE ${searchBy} LIKE '%${keyword}%' AND category_name='${category_name}' ORDER BY ${orderBy} ${order} LIMIT $1 OFFSET $2`;
  const val = [limit,offset];
  db.query(que,val,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res);
    }
  });
};

exports.countProductByCategory=(category_name,searchBy,keyword,cb)=>{
  const que = `SELECT product_name,
  product_desc,
  product_price,
  product_stock,
  product_condition,
  picture1,
  picture2,
  picture3,
  picture4, category_name FROM product_details  INNER JOIN category  ON product_details.category_id  = category.id WHERE ${searchBy} LIKE ${keyword} AND category_name='${category_name}'`;
  db.query(que,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res.rowCount);
    }
  });
};

exports.showProductByArchive=(archive_status,searchBy,keyword,orderBy,order,limit=parseInt(LIMIT_DATA), offset=0,cb)=>{

  const que = `SELECT product_name,
  product_desc,
  product_price,
  product_stock,
  product_condition,
  picture1,
  picture2,
  picture3,
  picture4, archive_status, category_name FROM product_details  INNER JOIN category   ON product_details.category_id  = category.id WHERE ${searchBy} LIKE '%${keyword}%' AND archive_status=${archive_status} ORDER BY ${orderBy} ${order} LIMIT $1 OFFSET $2`;
  const val = [limit,offset];
  db.query(que,val,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res);
    }
  });
};

exports.countProductByArchive=(archive_status,searchBy,keyword,cb)=>{
  const que = `SELECT product_name,
  product_desc,
  product_price,
  product_stock,
  product_condition,
  picture1,
  picture2,
  picture3,
  picture4, category_name FROM product_details  INNER JOIN category  ON product_details.category_id  = category.id WHERE ${searchBy} LIKE ${keyword} AND archive_status=${archive_status}`;
  db.query(que,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res.rowCount);
    }
  });
};


exports.detailProduct = (id, cb) => {
  const quer = `SELECT 
  product_name,
  product_desc,
  product_price,
  product_stock,
  product_condition,
  picture1,
  picture2,
  picture3,
  picture4, archive_status, category_name FROM product_details  INNER JOIN category  ON product_details.category_id  = category.id WHERE product_details.id=$1`;
  const value = [id];
  db.query(quer, value, (err, res)=>{
    if(err) {
      cb(err);
    }
    cb(err, res.rows);
  });
};