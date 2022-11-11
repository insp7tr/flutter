const express = require("express");
const mongoose = require("mongoose");

const adminRouter = require("./routes/admin");
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

const PORT = 3007;
const app = express();

app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

mongoose
  .connect("ADD CONNECTION STRING")
  .then(() => {
    console.log("MongoDB connection established");
  })
  .catch((error) => {
    console.log(error);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected to port ${PORT}`);
});
