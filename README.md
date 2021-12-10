# Xenshop Module
This repository contains all module that needed by xenshop application. All modules that contains in this repository split by feature or function of xenshop application. Every module can develop and testing standalone because have example app to introduct how to use that module. There are several module has been created in this repository:
- Customers should be able to view the list of the products based on the [product](https://github.com/chandrabezzo/xenshop-module/tree/main/xenshop_product) categories
- Customers should be able to add the products to the shopping [cart](https://github.com/chandrabezzo/xenshop-module/tree/main/xenshop_cart)
- Customers should be able to view the products listed on the shopping [cart](https://github.com/chandrabezzo/xenshop-module/tree/main/xenshop_cart)
- Customers should be able to remove the products listed on the shopping [cart](https://github.com/chandrabezzo/xenshop-module/tree/main/xenshop_cart)
- Customers should be able to checkout shopping cart and continue their transaction to payment page

## Project Structure
- [Core](https://github.com/chandrabezzo/xenshop-module/wiki/Core-Module-Structure)
- [Product](https://github.com/chandrabezzo/xenshop-module/wiki/Product-Module-Structure)
- [Cart](https://github.com/chandrabezzo/xenshop-module/wiki/Cart-Module-Structure)

## Requirements
- Flutter SDK 2.5.3
- Android with Minimum SDK Version 16
- iOS with Minimum OS Version 10
- Chrome to running this application on web
- Flutter Plugin
- Dart Plugin

## Configuration
To run this application, you need setup [https://github.com/chandrabezzo/xenshop-module/wiki/Configuration) to apply the configuration easy. But, if you a Android Studio user, you still can use that IDE with different configuration.

## Git Branch Strategy
This application implemented using [Trunk Based Development](https://trunkbaseddevelopment.com/) for Git Branch Strategy with `main` as `trunk`. We as engineer can't direct / force push to main, we need create a pull request (PR) with [format applied](https://github.com/chandrabezzo/xenshop-module/blob/main/pull_request_template.md). Another engineer will review then approve the PR. After PR approved with another engineer, we can merged the PR to main.

## Architechture
This project implemented with [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html), further [developed](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course) from the [Reso Coder TDD example](https://resocoder.com/flutter-clean-architecture-tdd). Click [here](https://github.com/chandrabezzo/xenshop/wiki/Clean-Architecture) to learn more about this project architecture.

# Running
If you want to running this project without IDE that support flutter and dart plugin. You need access example folder via terminal before you want to run this project. You can run this project using command
```
flutter run $args
```

### Mobile
```
flutter run
```
or release stage
```
flutter run --release
```

### Web
```
flutter run -d chrome
```
