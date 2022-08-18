const auth = require("express").Router();
const authController = require("../controllers/auth");
// hahahahahah
console.log(authController.register);
console.log("a");
auth.post("/register", authController.register);
auth.post("/login", authController.login);

module.exports = auth;
