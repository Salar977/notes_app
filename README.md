# 📝 Notes App

A simple yet powerful note-taking application built using **Flutter**. This app leverages modern Flutter architecture and state management using `Provider`, persistent local storage using `Isar`, and elegant UI components including `Popover`.

---

## 🚀 Features

- 🗂 Create, edit, delete personal notes
- 🎨 Theme switching (Light & Dark Mode)
- 📦 Persistent storage via Isar database
- 🔄 Real-time UI updates via Provider
- 📌 Interactive popovers for advanced actions and settings



---

## 🧰 Packages Used

| Package      | Description                                  |
|--------------|----------------------------------------------|
| [`provider`](https://pub.dev/packages/provider) | State management                        |
| [`isar`](https://pub.dev/packages/isar)         | Local NoSQL database                    |
| [`popover`](https://pub.dev/packages/popover)   | Displaying additional interactive content |

---

## 🧠 Architecture & State

- **Provider** handles state for both notes and theming
- **Isar** database ensures efficient and persistent note storage
- App initializes services in `main.dart` before launching `MainApp`

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NoteDatabase()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}
await NoteDatabase.initialize();
runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NoteDatabase()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: const MainApp(),
  )
);
```

## 💡 Getting Started
💡 Getting Started
Clone this repo:

1. Clone this repository:

```bash
git clone https://github.com/your-username/notes_app.git
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

📌 Note: Ensure you have Flutter SDK set up and a device/emulator running.
