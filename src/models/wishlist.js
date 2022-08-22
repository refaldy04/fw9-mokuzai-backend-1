const db = require ('../helpers/db');

exports.getAllWishlist = (user_id,cb) => {
  const q = 'SELECT product_name, product_stock, product_price, picture1 FROM wishlist INNER JOIN product_details ON product_details.id = wishlist.product_id INNER JOIN users ON users.id = wishlist.user_id WHERE wishlist.user_id = $1';
  db.query(q, [user_id], (err, res) =>{
    return cb(err, res.rows);
  });
};

exports.getWishlistById = (product_id, cb) =>{
  const q = 'SELECT product_name, product_stock, product_price, product_picture FROM wishlist INNER JOIN product_details ON product_details.id = wishlist.product_id WHERE product_id = $1';
  const val = [product_id];
  db.query(q, val, (err,res)=>{
    cb(err, res);
  });
};

exports.getWishlistByIdAndProductId = (id, cb) =>{
  const q = 'SELECT * FROM wishlist WHERE product_id=$1';
  const val = [id];
  console.log(id);
  db.query(q, val, (err,res)=>{
    console.log(err);
    cb(err, res);
  });
};

exports.addItemWishlist = (user_id, data, cb) =>{
  const q = 'INSERT INTO cart (quantity , product_id, user_id) VALUES ($1, $2, $3) RETURNING *';
  db.query(q, [1, data.product_id, user_id], (err,res)=>{
    cb(err,res.rows);
  });
};

exports.deleteItemWishlist = (id, cb) =>{
  const q = 'DELETE FROM wishlist WHERE id = $1 RETURNING *';
  const val = [id];
  db.query(q, val, (err,res)=>{
    cb(err, res.rows);
  });
};

