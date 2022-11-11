const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const { Product } = require("../models/product");
const Order = require("../models/order");

adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;

    let product = new Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });

    product = await product.save();
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

adminRouter.get("/admin/get-products", admin, async (req, res) => {
  try {
    const products = await Product.find({});

    res.json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

adminRouter.post("/admin/delete-product", async (req, res) => {
  try {
    const { id } = req.body;

    let product = await Product.findByIdAndDelete(id);

    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

adminRouter.get("/admin/get-orders", admin, async (req, res) => {
  try {
    const orders = await Order.find({});

    res.json(orders);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

adminRouter.post("/admin/change-order-status", async (req, res) => {
  try {
    const { id, status } = req.body;

    let order = await Order.findById(id);
    order.status = status;

    order = await order.save();

    res.json(order);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

adminRouter.get("/admin/analytics", admin, async (req, res) => {
  try {
    const orders = await Order.find({});
    let totalEarnings = 0;

    for (let index1 = 0; index1 < orders.length; index1++) {
      for (let index2 = 0; index2 < orders[index1].products.length; index2++) {
        totalEarnings +=
          orders[index1].products[index2].quantity *
          orders[index1].products[index2].product.price;
      }
    }

    let mobileEarnings = await fetchCategoryWiseProduct("Mobiles");
    let essentialsEarnings = await fetchCategoryWiseProduct("Essentials");
    let appliancesEarnings = await fetchCategoryWiseProduct("Appliances");
    let booksEarnings = await fetchCategoryWiseProduct("Books");
    let fashionEarnings = await fetchCategoryWiseProduct("Fashion");

    let earnings = {
      totalEarnings,
      mobileEarnings,
      essentialsEarnings,
      appliancesEarnings,
      booksEarnings,
      fashionEarnings,
    };
    res.json(earnings);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

const fetchCategoryWiseProduct = async (category) => {
  let categoryOrders = await Order.find({
    "products.product.category": category,
  });
  let earnings = 0;

  for (let index1 = 0; index1 < categoryOrders.length; index1++) {
    for (
      let index2 = 0;
      index2 < categoryOrders[index1].products.length;
      index2++
    ) {
      earnings +=
        categoryOrders[index1].products[index2].quantity *
        categoryOrders[index1].products[index2].product.price;
    }
  }

  return earnings;
};

module.exports = adminRouter;
