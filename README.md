# 📝 Todo App

A clean, minimal Flutter Todo application using BLoC state management and Hive for local storage. The app supports task categorization (Today, Daily, Weekly, Monthly), task completion, editing, deletion, splash screen, and dark mode.

---

## 📱 Screenshots

| Splash Screen                        | Home (Light) | Home (Dark) |
| ------------------------------------ | ------------ | ----------- |
| _Add your screenshots here manually_ |

---

## 🚀 Features

- 🧠 BLoC pattern for state management
- 💾 Persistent local storage with Hive
- ✅ Add, edit, delete, and complete tasks
- 📂 Categorize tasks by: Today, Daily, Weekly, Monthly
- 🌙 Light & Dark Theme support
- 🖼️ Custom splash screen
- 🧭 Tab-based UI navigation

---

## 🧱 Folder Structure

lib/
├── blocs/
│ └── todo/
│ ├── todo_bloc.dart
│ ├── todo_event.dart
│ └── todo_state.dart
├── models/
│ └── todo_models.dart
├── screens/
│ └── home_screen.dart
├── widgets/
│ ├── add_task_dialog.dart
│ ├── edit_task_dialog.dart
│ ├── tab_bar_widget.dart
│ └── task_list_widget.dart
└── main.dart

---

## 📦 Dependencies

| Package                           | Purpose                           |
| --------------------------------- | --------------------------------- |
| `flutter_bloc`                    | BLoC state management             |
| `hive` + `hive_flutter`           | Lightweight local storage         |
| `equatable`                       | Simplify state comparisons        |
| `path_provider`                   | Get app directory for Hive box    |
| `flutter_native_splash`           | Configure splash screen           |
| `flutter_launcher_icons`          | Custom app icon                   |
| `build_runner` & `hive_generator` | Code generation for Hive adapters |

---

## 🔧 How to Run

1. **Install dependencies**

   ```bash
   flutter pub get
   2.Generate Hive adapter
   flutter packages pub run build_runner build
   3.Run the app
   flutter run
   ```

🛠️ Customize App Icon
flutter_icons:
android: true
ios: true
image_path: "assets/todoapp.png.jpg"

Then run
flutter pub run flutter_launcher_icons:main

🌊 Customize Splash Screen

flutter_native_splash:
color: "#ffffff"
image: assets/todoapp.png.jpg
android: true
ios: true
fullscreen: true
android_gravity: center
ios_content_mode: center

Then run
flutter pub run flutter_native_splash:create

🧠 Git Setup
git init
git remote add origin https://github.com/Nasirullah2433/todo_app.git
git add .
git commit -m "Initial commit"
git push -u origin main

📄 License
This project is open source and available under the MIT License.

---

Let me know if you want me to generate a **`.pdf` version** of this `README.md` or if you want to auto-upload screenshots as well.
