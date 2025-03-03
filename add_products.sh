# Product 1 - Electronics
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "iPhone 15 Pro", "price": 999.99, "description": "Latest Apple smartphone with advanced features", "category": "electronics"}'
echo "\niPhone 15 Pro added\n"
# Product 2 - Clothing
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "Denim Jacket", "price": 79.99, "description": "Classic blue denim jacket with comfortable fit", "category": "clothing"}'
echo "\nDenim Jacket added\n"
# Product 3 - Books
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "The Art of Programming", "price": 49.99, "description": "Comprehensive guide to software development", "category": "books"}'
echo "\nThe Art of Programming added\n"
# Product 4 - Home & Kitchen
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "Coffee Maker", "price": 129.99, "description": "Automatic drip coffee maker with timer", "category": "home"}'
echo "\nCoffee Maker added\n"
# Product 5 - Sports
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "Yoga Mat", "price": 29.99, "description": "Non-slip exercise mat for yoga and fitness", "category": "sports"}'
echo "\nYoga Mat added\n"
# Product 6 - Beauty
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "Face Moisturizer", "price": 24.99, "description": "Hydrating daily face cream", "category": "beauty"}'
echo "\nFace Moisturizer added\n"
# Product 7 - Food
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "Organic Honey", "price": 15.99, "description": "Pure organic wildflower honey", "category": "food"}'
echo "\nOrganic Honey added\n"
# Product 8 - Toys
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "Building Blocks Set", "price": 39.99, "description": "Educational building blocks for children", "category": "toys"}'
echo "\nBuilding Blocks Set added\n"
# Product 9 - Tools
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "Power Drill", "price": 149.99, "description": "Cordless power drill with battery pack", "category": "tools"}'
echo "\nPower Drill added\n"    
# Product 10 - Furniture
curl -X POST http://localhost:3000/api/products \
  -H "Content-Type: application/json" \
  -d '{"name": "Office Chair", "price": 199.99, "description": "Ergonomic office chair with lumbar support", "category": "furniture"}'
echo "\nOffice Chair added\n"