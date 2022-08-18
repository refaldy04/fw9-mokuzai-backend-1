const db = require("../helpers/db");

exports.createUsers = (data, cb) => {
  const query =
    "INSERT INTO users (email, password, roles) VALUES($1, $2, $3) RETURNING *";
  const value = [data.email, data.password, data.roles];
  console.log(value);
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
