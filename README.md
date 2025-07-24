# World Clock App

A simple yet functional World Clock application built using **Flutter**.  
This was my **first Flutter project**, and it helped me understand the fundamentals of app development — from using APIs and building UI to handling logic and version control with GitHub.

## 📌 About The Project

This app allows users to view current times in various cities around the world.  
It fetches data using a time zone API and displays it in a clean, scrollable interface.

## 🔧 Features

- Fetches accurate time data using an API key
- Clean and minimal UI built with Flutter widgets
- Dynamic time zone updates across multiple regions
- Uses basic state management and logic handling
- Secrets are handled securely (excluded from repo)
- Git version-controlled from day one

## 🚀 Possible Future Improvements

Potential features that could be added:

- Custom time zone search
- Theme switching (light/dark)
- Local storage for recent zones
- Better error handling and API fallback

## 🎬 Demo

You can watch a short screen recording of the app [here](https://github.com/hunarkatyal/World_Clock/blob/d55ac31ce25ef4853cee9ee97add1cf1d0411a1e/Screen%20Recording%20Demo.webm)  
(Replace this with the actual video link if hosted)

## 📁 Installation

1. Clone the repo:

   ```bash
   git clone https://github.com/yourusername/world_clock_app.git
   ```

2. Navigate into the project folder:

   ```bash
   cd world_clock_app
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

**Note:** You'll need to create your own `secrets.dart` file since it's excluded from the repository for security reasons.

### Creating the secrets.dart file:

1. Create a new file at `lib/secrets.dart`
2. Add your API key in the following format:

   ```dart
   const String apiKey = "YOUR_API_KEY_HERE";
   ```

3. Replace `"YOUR_API_KEY_HERE"` with your actual time zone API key

**Getting an API Key:**
- You'll need a free API key from [TimeZoneDB](https://timezonedb.com/)
- This app is specifically built to work with TimeZoneDB's API endpoints

## 🛡️ .gitignore

- `.dart_tool/`
- `build/`
- `.idea/`
- `*.apk`
- `lib/secrets.dart` *(contains API key)*

## 📦 Release

The release version of the APK is available under `/release/v1.0.0.apk`

## 📚 License

This project is for learning purposes only and is not under any commercial license.

---

*Made with ❤️ during my Flutter learning journey*
