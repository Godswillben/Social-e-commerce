import  { Request, Response, NextFunction}  from "express";
const pgPool = require("../db/db")


// Create product
exports.createProduct = async (req:Request, res:Response) => {
    try{
        const { product_name, price } = req.body;

        if (product_name.length < 1){
            return res.status(400).send({'error':'Product name cannot be empty'})
        }else if (typeof(product_name) !== typeof(String())){
            return res.status(400).send({'error':'Product name can only be string'})
        }

        if (`${price}`.length < 1 || price == null){
            return res.status(400).send({'error':'Product price cannot be empty'})
        }else if(!Number.isInteger(price)){
            return res.status(400).send({'error':'price must be numberic value'})
        }

        const product = await pgPool.query(
            ` INSERT INTO product (product_name, price)  VALUES($1, $2) RETURNING *`,
            [product_name, price]
        );
        res.json(product);
    } catch (err: any){
        console.error(err.message);
    }
}

// Get all product
exports.productList = async(req:Request, res:Response)=>{
    try{
        const productList = await pgPool.query(`
            SELECT * FROM product
        `);
        res.json(productList.rows)
    }catch(err:any){
        console.error(err.message)
    }
}

// module.exports = createProduct()
