const db = require("../helpers/db");

exports.createProfileAfterRegister = (data, cb) => {
  const query = "INSERT INTO profile(user_id) VALUES($1) RETURNING *";
  const values = [data];
  db.query(query, values, (err, res) => {
    if (err) {
      cb(err);
    } else {
      cb(err, res.rows);
    }
  });
};
