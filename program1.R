products <- list(
  list(name = "Apple", price = 20),
  list(name = "Banana", price = 50),
  list(name = "Bread", price = 55),
  list(name = "Milk", price = 35),
  list(name = "Eggs", price = 30)
)

shopping_cart <- list()
cart_items_to_add <- list(
  list(name = "Apple", quantity = 3),
  list(name = "Banana", quantity = 2)
)

# Add items to the shopping cart
for (item in cart_items_to_add) {
  product_name <- item$name
  quantity <- item$quantity
  product <- NULL
  
  # Search for the product in the list
  for (p in products) {
    if (p$name == product_name) {
      product <- p
      break
    }
  }
  
  # If product found, add to shopping cart
  if (!is.null(product)) {
    cart_item <- list(name = product$name, quantity = quantity, price = product$price)
    shopping_cart <- append(shopping_cart, list(cart_item))
    cat("Item added successfully\n")
  } else {
    cat("Item not found !!!\n")
  }
}

# Generate receipt
subtotal <- 0
cat("\nReceipt\n")
for (item in shopping_cart) {
  item_subtotal <- item$price * item$quantity
  cat(sprintf("%-10s (%2d units) - Price: $%.2f - Subtotal: $%.2f\n", 
              item$name, item$quantity, item$price, item_subtotal))
  subtotal <- subtotal + item_subtotal
}


# Calculate tax and total cost
tax_rate <- 0.08
tax_amount <- subtotal * tax_rate
cost_before_tax <- subtotal
total_cost <- cost_before_tax + tax_amount

cat(sprintf("\nSubtotal: $%.2f\n", subtotal))
cat(sprintf("Tax Amount (8%%): $%.2f\n", tax_amount))
cat(sprintf("Total Cost: $%.2f\n", total_cost))

