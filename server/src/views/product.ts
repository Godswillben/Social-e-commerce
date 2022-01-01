import { Request, Response, NextFunction } from "express";
const pgPool = require("../db/db")

//Get single product
exports.getProduct = async (req: Request, res: Response) =>{
    try{
        const { id } = req.params;
        const product = await pgPool.query(`
            SELECT * FROM product WHERE id = $1
        `, [id])
        res.json(product.rows[0]);
    }catch(err: any){
        console.error(err.msg)
    }
}

