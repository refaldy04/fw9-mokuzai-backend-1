const db = require ('../helpers/db');

exports.getAllOrders = (user_id, cb) => {
  const q = 'SELECT o.user_id , c.quantity , p.product_name , p.product_price , p.picture1  , p2.total_price , p2.payment_status, c.status_cart  from orders o inner join cart c on c.id = o.cart_id inner join product_details p on p.id = c.product_id inner join payment p2 on p2.id = o.payment_id where o.user_id = $1';
  db.query(q, [user_id], (err, res) =>{
    console.log(err);
    return cb(err, res.rows);
  });
};