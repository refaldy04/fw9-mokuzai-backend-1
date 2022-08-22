const db = require ('../helpers/db');

exports.getAllFavorite = (user_id,cb) => {
  const q = 'SELECT product_name, product_stock, product_price, picture1 FROM favorite INNER JOIN product_details ON product_details.id = favorite.product_id INNER JOIN users ON users.id = favorite.user_id WHERE favorite.user_id = $1';
  db.query(q, [user_id], (err, res) =>{
    return cb(err, res.rows);
  });
};

exports.getFavoriteByIdAndProductId = (user_id, cb) =>{
  const q = 'SELECT * FROM favorite WHERE product_id=$1';
  const val = [user_id];
  db.query(q, val, (err,res)=>{
    cb(err, res);
  });
};

exports.addItemFavorite = (user_id, data, cb) =>{
  const q = 'INSERT INTO cart (quantity , product_id, user_id) VALUES ($1, $2, $3) RETURNING *';
  db.query(q, [1, data.product_id, user_id], (err,res)=>{
    cb(err,res.rows);
  });
};

exports.deleteItemFavorite = (id, cb) =>{
  const q = 'DELETE FROM favorite WHERE id = $1 RETURNING *';
  const val = [id];
  db.query(q, val, (err,res)=>{
    cb(err, res.rows);
  });
};