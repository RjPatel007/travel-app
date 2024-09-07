# travel-app
A Flutter application for managing travel-related tasks. This app allows users to explore destinations, plan trips, and manage their travel itineraries with ease.
## Flutter Version
This project uses Flutter version `3.24.2`. Ensure you have this version installed to avoid compatibility issues.
## Installation
1. **Clone the repository**:
    ```sh
    git clone https://github.com/RjPatel007/travel-app.git
    cd travel-app
    ```
2. **Install dependencies**:
    ```sh
    flutter pub get
    ```
3. **Set up the database**:
   Ensure that the `sqflite` and `sqflite_common_ffi` packages are properly configured in your `pubspec.yaml`.
## Usage
1. **Run the application**:
    ```sh
    flutter run
    ```
2. **Run tests**:
    ```sh
    flutter test
    ```
## Screens
The Travel App includes the following screens:
- **Home Screen**: Displays a list of travel destinations and allows users to explore various locations.
- **Share Screen**: Enables users to share their travel plans and itineraries with others.
- **Search Screen**: Provides functionality for users to search for destinations and activities.
## Running Tests
To run the tests for this application, follow these steps:
1. **Ensure the database is set up**:
   Make sure the database is properly initialized and configured.
2. **Run all tests**:
    ```sh
    flutter test
    ```
3. **Run a specific test file**:
    ```sh
    flutter test test/widget_test.dart
    ```
4. **Run tests with detailed output**:
    ```sh
    flutter test --verbose
    ```
## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.