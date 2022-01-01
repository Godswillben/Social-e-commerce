// 0559750914
import  express, {Application, Request, Response, NextFunction}  from "express";
const cors = require("cors");
const pgPool = require("./db/db")

const app: Application = express();
const PORT = process.env.PORT || 5000;

// middle ware
app.use(cors());
app.use(express.json());

app.post("/products", async (req: Request, res: Response) => {
    try{
        const { product_name, price } = req.body;
        const product = await pgPool.query(
            ` INSERT INTO product (product_name, price)  VALUES($1, $2) RETURNING *`,
            [product_name, price]
        );
        res.json(product);
    } catch (err: any){
        console.error(err.message);
    }
})


app.listen(PORT, ()=>{
    console.log(`
        Sever started....
        No error starting up sever

        Sever running on http://localhost:${PORT}
    `)
})


