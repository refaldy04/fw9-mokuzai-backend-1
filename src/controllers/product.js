const product = require('../models/product');
const response = require('../helpers/standardResponse');
const errorResponse = require('../helpers/errorResponse');
const {DATA_LIMIT} = process.env;

exports.createProduct = (req,res) =>{
  console.log(req.body);
  console.log('aaaaaaaaaaaaaaaa');
  console.log(req.files);
  const user_id= req.authUser.id;
  const category_id= req.body.category_id;
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
  const {searchBy='product_name',search='',sortBy='product_name',sort='DESC',limit=parseInt(DATA_LIMIT), page=1} = req.query;
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
      return response(res,'Showing Product',result.rows,pageInfo);
    });
  });
};

exports.editProduct = (req,res) => {
  const sellerId= req.authUser.id;
  const id_product = parseInt(req.params.id);
  console.log(req.body);
  let picture1 = null;
  let picture2 = null;
  let picture3 = null;
  let picture4 = null;
  req.files[0]!==undefined?picture1 = req.files[0].filename:picture1 = null;
  req.files[1]!==undefined?picture2 = req.files[1].filename:picture2 = null;
  req.files[2]!==undefined?picture3 = req.files[2].filename:picture3 = null;
  req.files[3]!==undefined?picture4 = req.files[3].filename:picture4 = null;
  product.editProduct(id_product,sellerId,req.body,picture1,picture2,picture3,picture4, (err,result)=>{
    if(err){
      return errorResponse(err,res);
    }
    return response(res,'Product Edited Succesfully', result.rows[0]);
  });
};

exports.deleteProduct = (req, res)=>{
  const id_product = parseInt(req.params.id);
  product.deleteProduct(id_product, (err, results)=>{
    if(results.length > 0){
      return response(res, 'Delete Product success', results);
    }else{
      return res.redirect('/404');
    }
  });
};

exports.showProductSeller = (req,res) => {
  const seller_id= req.authUser.id;
  const {searchBy='product_name',search='',sortBy='product_name',sort='DESC',limit=parseInt(DATA_LIMIT), page=1} = req.query;
  const offset = (page-1) * limit;
  product.showProductSeller(seller_id,searchBy,search,sortBy,sort,limit,offset,(err,result)=>{
    if(err){
      console.log(err);
      return errorResponse(err,res);
    }
    const pageInfo = {};
    product.countshowProductSeller(seller_id,searchBy,search,(err,totalusers)=>{
      pageInfo.totalData = totalusers;
      pageInfo.totalPage = Math.ceil(totalusers/limit);
      pageInfo.curretPage = parseInt(page);
      pageInfo.nextPage = pageInfo.curretPage < pageInfo.totalPage? pageInfo.curretPage+1:null;
      pageInfo.prevPage = pageInfo.curretPage > 1 ? pageInfo.curretPage-1:null;
      return response(res,'Showing Product by Store',result.rows,pageInfo);
    });
  });
};

exports.showProductByCategory = (req,res) => {
  const category_name = req.params.category_name;
  const {searchBy='product_name',search='',sortBy='product_name',sort='DESC',limit=parseInt(DATA_LIMIT), page=1} = req.query;
  const offset = (page-1) * limit;
  product.showProductByCategory(category_name,searchBy,search,sortBy,sort,limit,offset,(err,result)=>{
    if(err){
      console.log(err);
      return errorResponse(err,res);
    }
    const pageInfo = {};
    product.countProductByCategory(category_name,searchBy,search,(err,totalusers)=>{
      pageInfo.totalData = totalusers;
      pageInfo.totalPage = Math.ceil(totalusers/limit);
      pageInfo.curretPage = parseInt(page);
      pageInfo.nextPage = pageInfo.curretPage < pageInfo.totalPage? pageInfo.curretPage+1:null;
      pageInfo.prevPage = pageInfo.curretPage > 1 ? pageInfo.curretPage-1:null;
      return response(res,'Showing Product by Category',result.rows,pageInfo);
    });
  });
};

exports.showProductByArchive = (req,res) => {
  const archive_status = req.params.archive_status;
  const {searchBy='product_name',search='',sortBy='product_name',sort='DESC',limit=parseInt(DATA_LIMIT), page=1} = req.query;
  const offset = (page-1) * limit;
  product.showProductByArchive(archive_status,searchBy,search,sortBy,sort,limit,offset,(err,result)=>{
    if(err){
      console.log(err);
      return errorResponse(err,res);
    }
    const pageInfo = {};
    product.countProductByArchive(archive_status,searchBy,search,(err,totalusers)=>{
      pageInfo.totalData = totalusers;
      pageInfo.totalPage = Math.ceil(totalusers/limit);
      pageInfo.curretPage = parseInt(page);
      pageInfo.nextPage = pageInfo.curretPage < pageInfo.totalPage? pageInfo.curretPage+1:null;
      pageInfo.prevPage = pageInfo.curretPage > 1 ? pageInfo.curretPage-1:null;
      return response(res,'Archived Product',result.rows,pageInfo);
    });
  });
};

exports.detailProduct = (req, res)=>{
  const {id} =req.params;
  product.detailProduct(id, (err, results)=>{
    if(results.length > 0 ){
      return response(res, 'Product Details', results[0]); 
    }else{
      return res.redirect('/404');
    }
  });
};