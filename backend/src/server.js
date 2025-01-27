const express = require("express");
require("dotenv").config();

const authRoutes = require("./routes/auth_routes");
const credRoutes = require("./routes/cred_routes");
// const prodRoutes = require("./routes/prod_routes");

const app = express();
const port = 3000;

app.use(express.json());

// Use routes
app.use("/auth", authRoutes); // All auth routes will be prefixed with /auth
app.use("/creds", credRoutes); // All credential routes will be prefixed with /credentials
// app.use("/products", prodRoutes); // All product routes will be prefixed with /products

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
