const db = require("../helpers/db");

exports.createCart = (data, cb) => {
  const query =
    "INSERT INTO cart (user_id, quantity, product_id) VALUES($1, $2, $3) RETURNING *";
  const value = [data.user_id, data.quantity, data.product_id];
  console.log(value);
  db.query(query, value, (err, res) => {
    if (res) {
      cb(err, res.rows);
    } else {
      console.log(err);
      cb(err);
    }
  });
};

exports.getCartById = (id, cb) => {
  db.query(`SELECT cart.id,
  cart.quantity,
    product_details.product_name,
    product_details.product_price,
    product_details.picture1 FROM cart  INNER JOIN product_details  ON cart.product_id  = product_details.id WHERE cart.user_id=$1`, [id], (err, res) => {
    cb(err, res.rows);
  });
};

exports.editQuantity = (data, cb) => {
  const query =
    "UPDATE product_details SET product_stock=product_stock - $1  WHERE id=$2 RETURNING *";
  const value = [data.stock_selled, data.id];
  db.query(query, value, (err, res) => {
    if (res) {
      cb(err, res.rows);
    } else {
      console.log(err);
      cb(err);
    }
  });
};
