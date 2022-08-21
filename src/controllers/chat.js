const chat = require('../models/chat');
const response = require('../helpers/standardResponse');
const errorResponse = require('../helpers/errorResponse');

exports.getAllChat=(req,res)=>{
  const id= req.authUser.id;
  chat.getHistoryChat(id,(err,result)=>{
    if(err){
      console.log(err);
      return errorResponse(err,res);
    }
    return response(res,'All Chat',result.rows);
  });
};

exports.createChat=(req,res)=>{
  const id= req.authUser.id;
  if(req.body.costumer_id){
    chat.sellerChat(id,req.body,(err,result)=>{
      if(err){
        return errorResponse(err,res);
      }
      return response(res,'Chat to Costumer Sent',result.rows[0]);
    });
  }else{
    chat.costumerChat(id,req.body,(err,result)=>{
      if(err){
        console.log(err);
        return errorResponse(err,res);
      }
      return response (res,'Chat to Seller Sent', result.rows[0]);
    });}
};

exports.deleteChat=(req,res)=>{
  chat.deleteChat(req.params.id,(err,result)=>{
    if(err){
      return errorResponse(err,res);
    }else{
      return response(res,'Chat Deleted',result.rows[0]);
    }
  });
};