# TradePractical - Flutter Watchlist Application

A robust and scalable Flutter application demonstrating a stock watchlist with reordering capabilities.

## 🚀 Overview

TradePractical is a sample stock market application that allows users to view a list of stocks and reorder them according to their preference. The project is built with a focus on clean code, scalability, and modern Flutter development practices.

## 🏗️ Project Structure

The project follows a **Feature-Driven Architecture**, which ensures that the codebase remains organized and easy to maintain as it grows.

```text
lib/
├── core/                  # Shared utilities and global configurations
│   ├── constants/         # App strings, colors, and other constants
│   ├── routes/            # GoRouter configuration
│   └── theme/             # App-wide theme and text styles
├── features/              # Feature-specific modules
│   └── watchlist/         # Watchlist feature
│       ├── bloc/          # Business logic (Events, States, BLoC)
│       ├── models/        # Data models
│       ├── screens/       # UI Screens (Watchlist, Reorder)
│       └── widgets/       # Feature-specific reusable widgets
└── main.dart              # Entry point of the application
```

## 🛠️ Tech Stack & Libraries

- **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc) - Used for predictable state management and separating business logic from UI.
- **Routing:** [go_router](https://pub.dev/packages/go_router) - A declarative routing package for Flutter that supports deep linking and complex navigation.
- **Responsiveness:** [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) - Ensures the UI looks consistent across different screen sizes and densities.
- **Data Equality:** [equatable](https://pub.dev/packages/equatable) - Simplifies object comparison in BLoC states and events.

## 💡 Implementation Details

### Approach

1.  **BLoC Pattern:** I chose BLoC to manage the state of the watchlist. This allows for a clear separation between how the data is fetched/processed and how it is displayed.
    - `LoadWatchlist`: Fetches mock data (simulating a network call).
    - `ReorderWatchlist`: Handles the logic for moving items within the list.
    - `SaveWatchlist`: Persists the reordered list (currently back to the state).

2.  **Modular UI:** The UI is broken down into small, reusable widgets. This makes the code easier to test and maintain.
3.  **Theme Management:** A centralized theme configuration in `core/theme` ensures visual consistency throughout the app.
4.  **Responsive Design:** Using `ScreenUtil` allows the app to adapt its layout, font sizes, and spacing dynamically based on the device's screen dimensions.

### Key Features

- **Dynamic Watchlist:** Displays stock information including name, price, and percentage change.
- **Interactive Reordering:** Users can navigate to a dedicated reorder screen to rearrange their watchlist using long-press and drag-and-drop.
- **Mock Data Generation:** Uses a randomized generator to simulate real-time stock price fluctuations.

## ⚙️ Getting Started

### Prerequisites

- Flutter SDK: `^3.11.3`
- Dart SDK: `^3.11.3`

### Installation

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Run the application using `flutter run`.

---

Developed with ❤️ using Flutter.
