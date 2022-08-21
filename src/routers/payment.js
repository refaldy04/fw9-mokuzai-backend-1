const payment = require("express").Router();
const paymentController = require("../controllers/payment");

payment.post("/", paymentController.createPayment);

module.exports = payment;
