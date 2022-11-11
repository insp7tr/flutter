const express = require("express");
const productRouter = express.Router();
const auth = require("../middlewares/auth");
const { Product } = require("../models/product");

productRouter.get("/api/products", auth, async (req, res) => {
  try {
    const products = await Product.find({ category: req.query.category });

    res.json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

productRouter.get("/api/products/search/:name", auth, async (req, res) => {
  try {
    const products = await Product.find({
      name: { $regex: req.params.name, $options: "i" },
    });

    res.json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

productRouter.post("/api/rate-product", auth, async (req, res) => {
  try {
    const { id, rating } = req.body;

    let product = await Product.findById(id);

    for (let index = 0; index < product.ratings.length; index++) {
      if (product.ratings[index].userId == req.user) {
        product.ratings.splice(index, 1);
        break;
      }
    }

    const ratingSchema = {
      userId: req.user,
      rating,
    };

    product.ratings.push(ratingSchema);
    product = await product.save();

    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

productRouter.get("/api/deal-of-day", auth, async (req, res) => {
  try {
    let products = await Product.find({});

    products = products.sort((a, b) => {
      let aSum = 0;
      let bSum = 0;

      for (let index = 0; index < a.ratings.length; index++) {
        aSum += a.ratings[index].rating;
      }

      for (let index = 0; index < b.ratings.length; index++) {
        bSum += b.ratings[index].rating;
      }

      return aSum < bSum ? 1 : -1;
    });

    res.json(products[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = productRouter;
