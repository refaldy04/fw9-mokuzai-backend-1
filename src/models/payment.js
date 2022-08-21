const db = require("../helpers/db.js");

exports.createPayment = (data, cb) => {
  const query =
    "INSERT INTO payment (order_id, total_price, payment_status) VALUES($1, $2, $3) RETURNING *";
  const value = [data.order_id, data.total_price, data.payment_status];
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

exports.deleteOrder = (id, cb) => {
  console.log(id);
  const query = "DELETE FROM order WHERE id=$1 RETURNING *";
  const value = [id];
  console.log(value);
  db.query(query, value, (err, res) => {
    console.log(err);
    // cb(res.rows);
  });
};

exports.editStatusOrder = (id, status, cb) => {
  console.log(id);
  console.log(status);
  const query = "UPDATE orders SET status=$1 WHERE id=$2 RETURNING *";
  const value = [status, id];
  db.query(query, value, (err, res) => {
    if (res) {
      // console.log(res);
      cb(err, res.rows);
    } else {
      console.log(err);
      cb(err);
    }
  });
};
