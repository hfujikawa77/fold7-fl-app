# fold7_demo_fl

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Setup

1.  **Install Flutter:**
    If you don't have the Flutter SDK installed, please follow the official guide:
    [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)

2.  **Clone the repository:**
    ```sh
    git clone <repository-url>
    cd fold7_demo_fl
    ```

3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

## Build

### Android

- **Build APK (for debugging):**
  ```sh
  flutter build apk --debug
  ```
- **Build APK (for release):**
  ```sh
  flutter build apk --release
  ```
- **Build AppBundle (for Google Play):**
  ```sh
  flutter build appbundle --release
  ```

### iOS

- **Build for Simulator:**
  ```sh
  flutter build ios --simulator
  ```
- **Build for Release:**
  ```sh
  flutter build ios --release
  ```
  (Requires a configured Apple Developer account)

## Run

1.  **Connect a device or start an emulator/simulator.**
    - You can check connected devices with `flutter devices`.

2.  **Run the app:**
    ```sh
    flutter run
    ```