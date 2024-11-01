# Kojina - Home-cooked Meals Ordering App

*Kojina* is a mobile app that connects customers with home-cooked meal providers. The app allows users to explore a variety of fresh, home-cooked meal options from local kitchens, place daily meal orders, and even request larger orders for special events. The app bridges the gap between customers looking for authentic, home-cooked meals and small kitchen startups seeking greater exposure.

## Table of Contents
- [Kojina - Home-cooked Meals Ordering App](#kojina---home-cooked-meals-ordering-app)
  - [Table of Contents](#table-of-contents)
  - [Features](#features)
  - [Installation](#installation)
    - [Prerequisites](#prerequisites)
    - [Steps](#steps)
  - [Usage](#usage)
  - [API](#api)
  - [Contributing](#contributing)
  - [Acknowledgments](#acknowledgments)

---

## Features

- *Browse Kitchens*: Discover a variety of kitchens offering fresh, homemade meals.
- *Daily Meal Orders*: Order meals from the daily menu with customizable ingredients.
- *Event Orders*: Arrange large orders for events, with the option to order a taste box first.
- *Favorite Kitchens*: Save kitchens you love to easily find them later.
- *Discounted Meals*: Look for meals with discounts offered by kitchens.
- *Multiple Order Types*: Switch between daily meal orders and event-specific meal orders.
- *Personalized Recommendations*: Receive meal suggestions based on your preferences and order history.

---



## Installation

### Prerequisites

- *Flutter SDK*: Make sure you have Flutter installed on your system. You can install Flutter by following the instructions [here](https://flutter.dev/docs/get-started/install).
- *Android Studio*: For Android development, having Android Studio installed is recommended.
- *Backend Server*: Kojina uses a Laravel backend, so ensure you have a working instance of the server. Check the [(https://github.com/Mohamed-Ganaway/kojina-app.git)](#) or setup instructions if needed.

### Steps

1. *Clone the Repository*:
   bash
   git clone https://github.com/radwan-77/kojina_project.git
   cd kojina-app
   

2. *Install Dependencies*:
   bash
   flutter pub get
   

3. *Set Up Environment Variables*:
   - Create a .env file in the root directory.
   - Add your backend API endpoint or any other required environment variables:
     
     API_BASE_URL=https://grand-pangolin-typically.ngrok-free.app/api
     

4. *Run the App*:
   bash
   flutter run
   

5. *Build for Release (APK)*:
   bash
   flutter build apk --release
   

---

## Usage

1. *Browse and Select Kitchens*: Open the app to see a list of kitchens offering daily and event meals. Use the filter options to find specific meal types or dietary preferences.
2. *Place Orders*:
   - *Daily Orders*: Select a meal, adjust the ingredients if available, and submit the order.
   - *Event Orders*: Try a sample taste box before placing a larger event order.
3. *Track Orders*: Get real-time updates on order status and estimated delivery times.
4. *Save Locations*: Save frequently used delivery locations with custom names and descriptions.
5. *Mark Favorites*: Add kitchens to your favorites list for quick access.

---

## API

The app communicates with a Laravel-based backend. Here are some key endpoints used by the app:

- *Get Meals by Category*: GET /api/meals?category=<category_name>
- *Create Order*: POST /api/orders
- *Upload Meal Image*: POST /api/kitchens/{kitchen_id}/meals/{meal_id}/upload

For a full API documentation, check the backend [(https://documenter.getpostman.com/view/28962706/2sAXxY3ocm)](#).

---

## Contributing

We welcome contributions from the community! Here’s how you can help:

1. *Fork the Project*: Start by forking the repository.
2. *Create a Feature Branch*: (git checkout -b feature/new-feature)
3. *Commit Your Changes*: (git commit -m 'Add new feature')
4. *Push to the Branch*: (git push origin feature/new-feature)
5. *Open a Pull Request*

Please make sure your code adheres to the project's coding guidelines and includes tests for any new functionality.


## Acknowledgments

- Special thanks to the *Libyan Academy for Telecom & Informatics* for providing resources and support.
- Thanks to everyone who contributed to this project, including users, testers, and developers.

---