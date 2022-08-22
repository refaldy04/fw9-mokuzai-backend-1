const payment = require('express').Router();
const paymentController = require('../controllers/payment');
const newPaymentController = require('../controllers/newpayment');
const authMiddle = require('../middleware/auth');

payment.post('/', paymentController.createPayment);
payment.post('/new', authMiddle, newPaymentController.createPayment);
payment.patch('/edit/:id', authMiddle, newPaymentController.editPayment);

module.exports = payment;
