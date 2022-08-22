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
    console.log(err);
    cb(err, res);
  });
};