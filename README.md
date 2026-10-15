# NithiTracker — Personal Finance Tracker

Cross-platform finance tracker for Android and Web.

## Features
- Firebase Auth (Google + Email)
- Real-time transactions (Firestore)
- Manual / OCR (camera + PDF) / Bank-imported expenses
- AI insights via FastAPI + scikit-learn + Gemini
- Local notifications on transaction save
- Calendar with transaction markers

## Tech Stack
- Flutter 3.44, Dart 3.8
- Firebase Auth, Cloud Firestore
- Google ML Kit (on-device OCR)
- FastAPI + scikit-learn + Gemini API

## Setup
\`\`\`bash
git clone <https://github.com/23mani/NithiTracker-Mobile-Application-Development-Project>
cd NithiTracker
flutter pub get
flutter run -d chrome --dart-define=ML_API_BASE=https://your-ngrok-url
\`\`\`

## Build
\`\`\`bash
flutter build apk --release --split-per-abi
flutter build appbundle --release
flutter build web --release
\`\`\`

## Team
- Member 1 — Frontend, Auth, Firestore
- Member 2 — Backend, ML
- Member 3 — digital image processing ,testing
