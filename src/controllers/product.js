const product = require('../models/product');
const response = require('../helpers/standardResponse');
const errorResponse = require('../helpers/errorResponse');
const {LIMIT_DATA} = process.env;

exports.createProduct = (req,res) =>{
  //console.log(req.body);
  console.log(req.files);
  const user_id= req.authUser.id;
  const category_id= req.authUser.category_id;
  let picture1 = null;
  let picture2 = null;
  let picture3 = null;
  let picture4 = null;
  if(req.files){
    req.files[0]!==undefined?picture1 = req.files[0].filename:picture1 = null;
    req.files[1]!==undefined?picture2 = req.files[1].filename:picture2 = null;
    req.files[2]!==undefined?picture3 = req.files[2].filename:picture3 = null;
    req.files[3]!==undefined?picture4 = req.files[3].filename:picture4 = null;
  }
  product.createProduct(req.body,picture1,picture2,picture3,picture4,user_id, category_id, (err,result)=>{
    if(err){
      console.log(err);
      return errorResponse(err,res);
    }else{
      return response(res,'Create Product Success',result);
    }
  });
};

exports.showAllProduct = (req,res)=>{
  const {searchBy='name_product',search='',sortBy='product_id',sort='DESC',limit=parseInt(LIMIT_DATA), page=1} = req.query;
  const offset = (page-1) * limit;
  product.showAllProduct(searchBy,search,sortBy,sort,limit,offset,(err,result)=>{
    if(err){
      console.log(err);
      return errorResponse(err);
    }
    const pageInfo = {};
    product.countAllProduct(searchBy,search,(err,totalusers)=>{
      pageInfo.totalData = totalusers;
      pageInfo.totalPage = Math.ceil(totalusers/limit);
      pageInfo.curretPage = parseInt(page);
      pageInfo.nextPage = pageInfo.curretPage < pageInfo.totalPage? pageInfo.curretPage+1:null;
      pageInfo.prevPage = pageInfo.curretPage > 1 ? pageInfo.curretPage-1:null;
      return response(res,'Showing History',result.rows,pageInfo);
    });
  });
};