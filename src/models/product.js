const db = require('../helpers/db');
const {LIMIT_DATA} = process.env;

exports.createProduct = (data, picture1, picture2, picture3, picture4, user_id, category_id, cb) => {
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
  const que = `SELECT * FROM products JOIN variant ON variant.product_id=products.id JOIN size ON size.variant_id=variant.id WHERE ${searchBy} LIKE '%${keyword}%' ORDER BY ${orderBy} ${order} LIMIT $1 OFFSET $2`;
  const val = [limit,offset];
  db.query(que,val,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res);
    }
  });
};

exports.countAllProducts=(searchBy,keyword,cb)=>{
  const que = `SELECT * FROM products JOIN variant ON variant.product_id=products.id JOIN size ON size.variant_id=variant.id WHERE ${searchBy} LIKE ${keyword}`;
  db.query(que,(err,res)=>{
    if(err){
      cb(err);
    }else{
      cb(err,res.rowCount);
    }
  });
};

// SELECT product_name
// product_desc,
// product_price,
// product_stock,
// product_condition,
// picture1,
// picture2,
// picture3,
// picture4, category_name FROM product_details  INNER JOIN category  ON product_details.category_id  = category.id;
