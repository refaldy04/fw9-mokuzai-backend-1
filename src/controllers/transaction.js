const userModel = require("../models/users");
const transactionModel = require("../models/transaction");
const response = require("../helpers/standardResponse");
const errorResponse = require("../helpers/errorResponse");
const { validationResult } = require("express-validator");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

exports.addChart = (req, res) => {
  console.log(req.body);

  // return response(res, "Good Job", userResult);
  transactionModel.createCart(req.body, (err, result) => {
    return response(res, "good job", result);
  });
};
