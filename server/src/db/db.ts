// import Pool from "pg"
const PGPool = require("pg").Pool;

const pgPool = new PGPool({
    user:"postgres",
    password: "kingdom123Freedom",
    host: "localhost",
    port: 5432,
    database: "social_market"
})

module.exports = pgPool;
