# Product Listing App

## Description
A Flutter app for browsing products, managing wishlist, and viewing banners with responsive UI. Built using BLoC and clean architecture, ensuring a clear separation of concerns and maintainable code.

## Features
- User authentication: Login & Register
- Fetch and search products from API
- Fetch banners from API
- Fetch and manage wishlist items (add/remove)
- Fetch user deatils from API
- Responsive UI using flutter_screenutil
- State management with BLoC following clean architecture


## Folder Structure
- `core/` - Common utilities, constants, helpers, and shared resources.
- `blocs/` - Business logic components
- `models/` - Data models for API and database responses, using freezed annotations for immutability.
- `entity/` - Pure data models for the domain layer
- `usecase/`  – Domain layer logic; each use case represents a single operation 
- `repository/` - API and storage
- `screens/` - UI screens
- `widgets/` - Reusable widgets

### Prerequisites
- Flutter 3.35.3
- Dart >= 3.9.2
- Android

### Installation
```bash
git clone <repo-url>
cd project_name
flutter pub get
flutter run


