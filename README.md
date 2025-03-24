# E-Commerce Application (Ruby on Rails)

## Overview
This is a full-featured e-commerce application built using **Ruby on Rails** with **JavaScript, HTML, and CSS** for the frontend and **SQLite3** as the database. It provides all the essential e-commerce functionalities, including product management, user authentication, shopping cart, checkout, and order management.

## Features
- **User Authentication** (Sign up, Login, Logout, Profile Management)
- **Product Management** (CRUD operations for admins)
- **Shopping Cart** (Add, Remove, Update items)
- **Checkout Process** (Order summary, Payment gateway integration)
- **Order Management** (Order tracking, History)
- **Category & Search Functionality**
- **Responsive UI** for seamless experience across devices
- **Admin Panel** for managing users, orders, and products

## Tech Stack
- **Backend:** Ruby on Rails
- **Frontend:** JavaScript, HTML, CSS
- **Database:** SQLite3
- **Authentication:** Devise (for user management)
- **Payment Gateway:** Stripe (or other integrations if needed)
- **Testing:** RSpec, Capybara

## Installation & Setup
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/yourusername/ecommerce-rails.git
   cd ecommerce-rails
   ```

2. **Install Dependencies:**
   ```sh
   bundle install
   npm install
   ```

3. **Set Up Database:**
   ```sh
   rails db:create db:migrate db:seed
   ```

4. **Start the Server:**
   ```sh
   rails server
   ```
   Visit `http://localhost:3000` in your browser.

## Usage
- Register or log in to your account.
- Browse products and add them to the shopping cart.
- Proceed to checkout and complete payment.
- Track orders from your profile dashboard.
- Admins can manage products, orders, and users.
