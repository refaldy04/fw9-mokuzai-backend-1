const response = require ('../helpers/standardResponse');
const errorResponse = require ('../helpers/errorResponse');
const profileModels = require ('../models/profile');


exports.getAllProfiles = (req, res)=>{
  
  profileModels.getAllProfile((err, results) =>{
    console.log(results);
    return response(res, 'Get All Profile', results);
  });
};

exports.getProfilebyId = (req, res)=>{
  const {id} = req.params;
  profileModels.getProfilebyId(id, (err,results)=>{
    return response(res, 'Profile User', results.rows[0]);
  });
};

exports.createProfiles = (req, res) =>{
  let filename = null;
  if(req.file){
    filename = req.file.filename;
  }
  profileModels.createProfiles(req.body, filename, (err, results)=>{
    if(err){  
      return errorResponse(err,res);
    }else{
      return response(res, 'Create Profiles successfully', results.rows[0]);  
    }
  });
};

exports.updateProfiles = (req, res) =>{
  const {id} = req.params;
  let filename = null;
  if(req.file){
    filename = req.file.filename;
  }
  profileModels.updateProfiles(id, filename, req.body, (err, results)=>{
    console.log(results);
    if(err){
      return errorResponse(err,res);
    }
    return response(res, 'UPDATE data success!', results.rows[0]);
  });
};
