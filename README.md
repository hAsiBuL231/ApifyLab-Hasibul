## 🛠️ Tech Stack
- **Flutter** - Cross-platform mobile framework
- **BLoC** - State management
- **Dart** - Programming language
- **REST API**

## 🚀 Features
- Login & Authentication
- Newsfeed with Post Reactions
- Post Creation
- Logout Confirmation

## 🎯 Decisions & Assumptions
- **Comment & Reply API:** The `feed_id` was missing in the API response, so this part was skipped.
- **Time Constraints:** Due to a short development timeline, some functionalities were skipped.

## 🔧 Installation & Setup

### Prerequisites
- Flutter SDK installed ([Get Flutter](https://flutter.dev/docs/get-started/install))
- Android Studio / VS Code
- Dart SDK

### Steps to Run the Project

1. **Clone the Repository**
2. For a specific platform:
   Android: flutter run --release
   iOS: flutter build ios && flutter run

## 🔧 How to run the APP
- Download the apk file
- install the app on android device

📂 Folder Structure
lib/  
│── api/               # Api files  
│── bloc/              # BLoC files  
│── components/        # Reusable Widgets   
│── model/             # Data models  
│── module/            # Data Store  
│── repositories/      # API/Data fetching logic  
│── screens/           # UI Screens  
│── utils/             # Utilities  
│── main.dart           # App Entry Point  

📜 License
This project is licensed under the MIT License.

🤝 Contributing
Pull requests are welcome! If you find any issues, please open an issue or contribute with a PR.

✨ Author
MD. Hasibul Hossain
Contact: hossainhasibul2@gmail.com