const express = require("express");
const router = express.Router();
const Product = require("../models/Product");


//GET products with search and price filter

router.get("/", async (req, res) => {
  const { q, minPrice, maxPrice } = req.query;
  let query = {}; 

  if (q) {
    query.$text = { $search: q }
  }

  if (minPrice || maxPrice) {
    query.price = {}
    if (minPrice) query.price.$gte = parseFloat(minPrice)
    if (maxPrice) query.price.$lte = parseFloat(maxPrice)
  }

  try {
    const products = await Product.find(query)
    res.json(products)
  } catch (error) {
    res.status(500).json({error: "error fetching products"})
  }
})

// GET products by category
router.get("/category/:category", async (req, res) => {
  try {
    const products = await Product.find({ category: req.params.category });
    res.json(products);
  } catch (error) {
    res.status(500).json({ error: "Error fetching products by category" });
  }
});

// GET single product by ID
router.get("/:id", async (req, res) => {
  try {
    const product = await Product.findById(req.params.id);
    if (!product) {
      return res.status(404).json({ error: "Product not found" });
    }
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: "Error fetching product" });
  }
});

// POST new product
router.post("/", async (req, res) => {
  try {
    const { name, price, description, category} = req.body;
    if (!category) {
      return res.status(400).json({ error: "Category is required" });
    }
    const product = new Product(req.body);
    const savedProduct = await product.save();
    res.status(201).json(savedProduct);
  } catch (error) {
    res.status(500).json({ error: "Error creating product" });
  }
});

// PUT update product
router.put("/:id", async (req, res) => {
  try {
    const { category, ...updateFields } = req.body;

    // If category is provided, ensure it's not empty
    if (category !== undefined && category.trim() === "") {
      return res.status(400).json({ error: "Category cannot be empty" });
    }

    if (category) updateFields.category = category;

    const product = await Product.findByIdAndUpdate(req.params.id, updateFields, {
      new: true,
      runValidators: true,
    });

    if (!product) {
      return res.status(404).json({ error: "Product not found" });
    }

    res.json(product);
  } catch (error) {
    res.status(500).json({ error: "Error updating product" });
  }
});

// DELETE product
router.delete("/:id", async (req, res) => {
  try {
    const product = await Product.findByIdAndDelete(req.params.id);
    if (!product) {
      return res.status(404).json({ error: "Product not found" });
    }
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ error: "Error deleting product" });
  }
});

// DELETE all products
router.delete("/", async (req, res) => {
  try {
    await Product.deleteMany();
    res.status(204).send();
  } catch (error) {
    console.error("Error deleting all products", error);
    res.status(500).json({ error: "Error deleting all products" });
  }
});

module.exports = router;
