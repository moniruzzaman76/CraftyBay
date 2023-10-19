# flutter_ecommerce

A new Flutter project.

![all](https://github.com/moniruzzaman76/Ecommerce-App/assets/107347380/bd7d6a00-b3c5-438a-9eec-a6a246588ccf)

## Description
CraftyBay is a feature-rich ecommerce app designed to provide users with a seamless and enjoyable shopping experience. With a focus on user-friendliness and a wide range of products, CraftyBay allows users to explore, purchase, and review products with ease.

## Responsibilities

 - As the creator of CraftyBay, my responsibilities included:

 - App Development: Developing and designing the CraftyBay ecommerce app, ensuring a user-friendly interface and smooth navigation.

 - Product Management: Organizing products into categories. Implementing a dynamic product carousel slider for an engaging shopping experience.

 - User Profiles: Enabling users to create and manage their profiles, making it convenient for them to track their orders and preferences.

 - Product Customization: Implementing the ability for users to select products by color and size, ensuring they can find items that suit their preferences.

 - Wishlist Functionality: Allowing users to add products to their wishlist, making it easy for them to save items they are interested in for future purchases.

 - Product Reviews: Incorporating a review system, enabling users to share their thoughts and experiences with purchased products.

## Challenges Faced
During the development of CraftyBay, several challenges were encountered, including:

 - User Authentication: Overcoming the challenge of securely saving and managing user tokens to ensure data privacy and user account protection.

 - Navigation Design: Creating an intuitive and user-friendly navigation system that helps users easily access their cart, wishlist, and additional options.

 - State Management and API Optimization: Ensuring efficient state management within the app and minimizing unnecessary API calls to enhance performance and reduce data usage.

## How Challenges Were Overcome
To address these challenges, several strategies and solutions were implemented:

 - User Authentication: Rigorous security measures were put in place to safeguard user tokens, ensuring that user accounts and data are protected from unauthorized access.

 - Navigation Design: Extensive user testing and feedback collection were conducted to refine the app's navigation, making it as intuitive as possible for users to access their cart, wishlist, and other options.

 - State Management: We implemented a robust state management system, utilizing tools and libraries such as GetX or the built-in setState mechanism, depending on the app's architecture. This allowed us to efficiently manage the app's state, ensuring data consistency and responsiveness.

 - Reducing API calls: To optimize app performance, we've reduced the number of API calls where data is fetched and updated only when needed, reducing app data consumption and enhancing user experience.

CraftyBay is continuously evolving to enhance the shopping experience for users, and your feedback and contributions are welcome. Thank you for considering CraftyBay for your ecommerce needs!


# Project Structure
```
CraftyBoy/
├── assets/
│   └── images/
│       ├── logo.svg
│       ├── product.png
│       └── logo_nav.svg
└── lib/
    ├── application/
    │   ├── app.dart
    │   └── state_holder_binders.dart
    ├── data/
    │   ├── model/
    │   │   ├── category_model_data.dart
    │   │   ├── category_model.dart
    │   │   ├── card_list_model.dart
    │   │   ├── home_sliders_model.dart
    │   │   ├── product_details_data.dart
    │   │   ├── product_details_model.dart
    │   │   ├── product_remark_model.dart
    │   │   ├── product_remark_model_data.dart
    │   │   ├── product_review_model.dart
    │   │   ├── read_profile_model.dart
    │   │   └── slider_model_data.dart
    │   ├── services/
    │   │   ├── network_response.dart
    │   │   └── network_caller.dart
    │   └── utils/
    │       └── urls.dart
    ├── presentation/
    │   └── ui/
    │       ├── screen/
    │       │   ├── auth/
    │       │   │   ├── email_verify_screen.dart
    │       │   │   ├── otp_verify_screen.dart
    │       │   │   └── create_profile_screen.dart
    │       │   ├── botom_nav_bar_screen.dart
    │       │   ├── card_list_screen.dart
    │       │   ├── categories_screen.dart
    │       │   ├── category_product_list_screen.dart
    │       │   ├── create_review_screen.dart
    │       │   ├── home_screen.dart
    │       │   ├── product_details_screen.dart
    │       │   ├── product_list_screen.dart
    │       │   ├── product_review_list_screen.dart
    │       │   ├── splash_screen.dart
    │       │   └── wish_list_screen.dart
    │       ├── utils/
    │       │   ├── app_colors.dart
    │       │   ├── color_extension.dart
    │       │   └── image_assets.dart
    │       └── widgets /
    │           ├── home/
    │           │   ├── home_slider.dart
    │           │   ├── product_image_slider.dart
    │           │   └── section_header.dart
    │           ├── add_to_card_list.dart
    │           ├── app_bar_back_button.dart
    │           ├── category_card.dart
    │           ├── circular_button.dart
    │           ├── custom_stepper.dart
    │           ├── increment_decrement.dart
    │           ├── payment_card.dart
    │           ├── product_card.dart
    │           ├── section_title_text.dart
    │           └── wishList_product_card.dart
    ├── State_holders/
    │   ├── home_slider.dart
    │   ├── product_image_slider.dart
    │   ├── section_header.dart
    │   ├── auth_controller.dart
    │   ├── card_list_controller.dart
    │   ├── category_controller.dart
    │   ├── category_product_list_controller.dart
    │   ├── complete_profile_controller.dart
    │   ├── create_add_to_card_controller.dart
    │   ├── create_review_controller.dart
    │   ├── CreateWishListController.dart
    │   ├── email_verification_controller.dart
    │   ├── home_sliders_controller.dart
    │   ├── main_botom_nav_controller.dart
    │   ├── otp_verify_controller.dart
    │   ├── product_delet_controller.dart
    │   ├── product_details_controller.dart
    │   ├── product_new_controller.dart
    │   ├── product_popular_controller.dart
    │   ├── product_special_controller.dart
    │   ├── read_profile_controller.dart
    │   ├── review_list_controller.dart
    │   └── wish_list_controller.dart
    └── main.dart
```


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
