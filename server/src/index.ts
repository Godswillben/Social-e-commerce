// 0559750914
import  express, {Application, Request, Response, NextFunction}  from "express";
const cors = require("cors");
const Products = require("./views/products");
const Product = require("./views/product");


const app: Application = express();
const PORT = process.env.PORT || 5000;

// middle ware
app.use(cors());
app.use(express.json());

// urls
app.post("/product", Products.createProduct);
app.get("/product", Products.productList);

app.get("/product/:id", Product.getProduct);


app.listen(PORT, ()=>{
    console.log(`
        Sever started....
        No error starting up sever

        Sever running on http://localhost:${PORT}
    `)
})


