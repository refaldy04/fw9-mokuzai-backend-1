const response = require('../helpers/standardResponse');
const authModel = require('../models/auth_seller');
const errResponse = require('../helpers/errorResponse');
// const bcrypt = require('bcrypt');
// const jwt = require('jsonwebtoken');
// const {APP_SECRET} = process.env;

exports.registerSeller = (req,res) => {
  authModel.createRegister(req.body,(err)=>{
    if(err){
      return errResponse(err,res);
    }
    return response(res,'Create Success');
  });
};