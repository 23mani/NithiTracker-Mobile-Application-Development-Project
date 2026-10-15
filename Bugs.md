## Bugs Found & Fixed

### Bug 1: Firebase duplicate-app crash
Fixed by wrapping init in try/catch for `duplicate-app`.

### Bug 2: Google Sign-In ApiException: 10
Fixed by registering debug SHA-1 in Firebase Console.

### Bug 3: ListTile overflow in Home
Fixed by replacing Container(decoration) with Material(color).

### Bug 4: ML Insights 500 error
Fixed by adding `errors="coerce"` to pandas.to_datetime.

### Bug 5: R8 stripped ML Kit classes
Fixed by disabling minify in release or adding proguard rules.

### Bug 6: Missing desugaring for flutter_local_notifications
Fixed by enabling `isCoreLibraryDesugaringEnabled = true` in app/build.gradle.kts.
