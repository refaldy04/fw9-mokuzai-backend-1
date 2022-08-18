const transaction = require("express").Router();
const transactionController = require("../controllers/transaction");
const { body } = require("express-validator");

transaction.post("/", transactionController.addChart);
// auth.post("/login", authController.login);

module.exports = transaction;
