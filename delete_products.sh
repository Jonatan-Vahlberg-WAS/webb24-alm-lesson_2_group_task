#!/bin/bash

echo "=== Deleting All Products ==="
curl -X DELETE http://localhost:3000/api/products/

echo "All products deleted"
