# Initialize empty inventory
inventory_items <- character(0) 
inventory_quantities <- numeric(0) 

# Function to add items to the inventory
add_item <- function(item, quantity) { 
  inventory_items <<- c(inventory_items, item) 
  inventory_quantities <<- c(inventory_quantities, quantity) 
  cat("Item added to inventory.\n")
} 

# Function to update item quantity in the inventory
update_quantity <- function(item, new_quantity) { 
  if (item %in% inventory_items) { 
    item_index <- which(inventory_items == item) 
    inventory_quantities[item_index] <<- new_quantity 
    cat("Quantity updated.\n")
  } else { 
    cat("Item not found in inventory.\n")
  }
} 

# Function to display the inventory
display_inventory <- function() { 
  cat("\nInventory Items and Quantities:\n") 
  for (i in 1:length(inventory_items)) { 
    cat(sprintf("%s: %d\n", inventory_items[i], inventory_quantities[i]))
  }
} 

# Main loop to interact with the user
while (TRUE) { 
  cat("\n1. Add Item\n2. Update Quantity\n3. Display Inventory\n4. Exit\n")
  choice <- as.integer(readline("Enter your choice: ")) 
  
  if (choice == 1) { 
    item <- readline("Enter item name: ") 
    quantity <- as.integer(readline("Enter quantity: ")) 
    if (!is.na(quantity) && quantity >= 0) {
      add_item(item, quantity) 
    } else {
      cat("Invalid quantity. Please enter a positive integer.\n")
    }
  } else if (choice == 2) { 
    item <- readline("Enter item name: ") 
    new_quantity <- as.integer(readline("Enter new quantity: "))
    if (!is.na(new_quantity) && new_quantity >= 0) {
      update_quantity(item, new_quantity) 
    } else {
      cat("Invalid quantity. Please enter a positive integer.\n")
    }
  } else if (choice == 3) { 
    display_inventory() 
  } else if (choice == 4) {
    cat("Exiting the program. Goodbye!\n") 
    break 
  } else { 
    cat("Invalid choice. Please try again.\n") 
  } 
}
