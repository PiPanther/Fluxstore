#Overview
Shopro is a sophisticated e-commerce application developed using Flutter. It provides a smooth and interactive shopping experience with features like product listing, detailed product views, cart management, and efficient state management using Riverpod.

##Project Structure
lib/: The main source code directory.
components/: Contains reusable UI components.
custom_button.dart: Defines a customizable button widget.
product_category_tile.dart: Widget for displaying product categories on the home screen.
constants/: Centralized file for shared constants.
constants.dart: Stores common text styles, colors, and padding values to ensure consistency across the app.
models/: Contains data models.
data_model.dart: Defines the data structure for products and reviews.
providers/: Contains state management logic.
cart_provider.dart: Manages the cart state and actions (e.g., adding/removing products).
product_list_provider.dart: Fetches and manages the list of products.
screens/: Contains different screens of the app.
cart_screen.dart: Displays the user's cart and allows product removal.
home_screen.dart: Shows the product categories and a list of products.
product_description.dart: Provides detailed information about a selected product.
main.dart: The entry point of the application.

