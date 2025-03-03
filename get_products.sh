#!/bin/bash

echo "=== Getting All Products ==="
curl -X GET http://localhost:3000/api/products \
  -H "Content-Type: application/json" | json_pp

echo -e "\n=== Search Products (with query parameter) ==="
curl -X GET "http://localhost:3000/api/products?q=iPhone" \
  -H "Content-Type: application/json" | json_pp

# Let's first get all products to get an ID, then use it for single product fetch
echo -e "\n=== Getting First Product ID ==="
FIRST_PRODUCT_ID=$(curl -s http://localhost:3000/api/products | grep -o '"_id":"[^"]*"' | head -n 1 | cut -d'"' -f4)

echo -e "\n=== Getting Single Product by ID ==="
curl -X GET "http://localhost:3000/api/products/$FIRST_PRODUCT_ID" \
  -H "Content-Type: application/json" | json_pp

# Examples of different search queries
echo -e "\n=== Search Products (Furniture) ==="
curl -X GET "http://localhost:3000/api/products?q=chair" \
  -H "Content-Type: application/json" | json_pp

echo -e "\n=== Search Products (Electronics) ==="
curl -X GET "http://localhost:3000/api/products?q=iPhone" \
  -H "Content-Type: application/json" | json_pp