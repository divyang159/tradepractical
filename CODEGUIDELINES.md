# 📘 CODEGUIDELINES.md — Flutter Standards (STRICT)

## 🎯 Purpose

This document defines **strict Flutter coding rules** for this project.
All AI-generated and manual code **MUST follow these rules**.

If any rule is violated → code is **INVALID**.

---

## 🏗️ Project Structure (FINAL)

```
lib/
│
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   ├── app_assets.dart
│   │
│   ├── theme/
│   │   ├── app_text_styles.dart
│   │
│   ├── network/
│   │
│   ├── routes/
│   │   ├── app_router.dart
│   │   ├── app_routes.dart
│   │
│   ├── utils/
│
├── features/
│   ├── feature_name/
│   │   ├── bloc/
│   │   │   ├── feature_bloc.dart
│   │   │   ├── feature_event.dart
│   │   │   ├── feature_state.dart
│   │   │
│   │   ├── models/
│   │   │   ├── feature_model.dart
│   │   │
│   │   ├── screens/
│   │   │   ├── feature_screen.dart
│
├── main.dart
```

---

## 📱 Responsive UI (MANDATORY)

We use `flutter_screenutil`.

### Rules:

* ❌ No fixed sizes
* ✅ Always use:

  * `.w` → width
  * `.h` → height
  * `.sp` → font size
  * `.r` → radius

### Example:

```dart
padding: EdgeInsets.all(16.w);
fontSize: 14.sp;
borderRadius: BorderRadius.circular(12.r);
```

---

## 🎨 Styling Rules (VERY STRICT)

### ❌ Forbidden:

* `TextStyle()` directly
* Hardcoded font sizes
* Inline styling

### ✅ Mandatory:

Use only Material TextTheme

```dart
Theme.of(context).textTheme.titleMedium
Theme.of(context).textTheme.bodyLarge
```

### Custom styles:

All custom styles must be defined in:

```
core/theme/app_text_styles.dart
```

---

## 🧱 Constants Usage (MANDATORY)

Hardcoded values are **STRICTLY PROHIBITED**

### Use:

#### Colors

```dart
AppColors.primary
```

#### Strings

```dart
AppStrings.loginTitle
```

#### Assets

```dart
AppAssets.logo
```

---

## 🚦 Routing Rules

Using `go_router`

### Rules:

* All routes must be defined in:

```
core/routes/app_router.dart
```

* ❌ Do NOT use Navigator

### Example:

```dart
context.go(AppRoutes.home);
```

---

## 🔁 State Management (Bloc)

Using `flutter_bloc`

### Structure:

```
bloc/
├── feature_bloc.dart
├── feature_event.dart
├── feature_state.dart
```

### Rules:

* One Bloc per feature
* UI must NOT contain business logic
* Bloc handles state only

---

## 🌐 Networking (Dio)

Using `Dio`

### Rules:

* Single Dio instance in `core/network`
* ❌ No direct Dio usage in UI

---

## 🔌 API Handling (VERY IMPORTANT)

### ❌ NOT ALLOWED:

* API calls inside UI

### ✅ REQUIRED:

* API calls inside Bloc


### Flow:

```
UI → Bloc → Dio → API
```

---

## 📦 Models

### Location:

```
features/feature_name/models/
```

### Rules:

* Must be simple and clean
* Must include:

```dart
factory Model.fromJson(Map<String, dynamic> json)
Map<String, dynamic> toJson()
```

---

## 🧩 Widget Rules

* Break large UI into smaller widgets
* Use `const` constructors wherever possible

---

## 📏 Code Rules

### MUST:

* Use `final` wherever possible
* Keep code modular

---

## ⚠️ Error Handling

* No empty catch blocks
* Always handle errors properly

---

## 🚫 Strictly Forbidden

❌ Hardcoded colors
❌ Hardcoded strings
❌ Hardcoded font sizes
❌ Direct Dio usage in Bloc/UI
❌ Navigator usage
❌ `TextStyle()` directly
❌ Fixed sizes without ScreenUtil
❌ Mixing logic inside UI

---

## 🤖 AI Code Generation Rules

AI MUST:

1. Use `flutter_screenutil` for all sizing
2. Use Material `textTheme` only
3. Use constants for colors, strings, assets
4. Use Bloc for state management
5. Use `go_router` for navigation
6. Use Dio only via service layer
7. Follow folder structure EXACTLY
8. Write modular, clean, readable code

---

## ✅ Example (CORRECT)

```dart
Text(
  AppStrings.loginTitle,
  style: Theme.of(context).textTheme.titleMedium,
)
```

---

## ❌ Example (INVALID)

```dart
Text(
  "Login",
  style: TextStyle(fontSize: 16, color: Colors.black),
)
```

---

## 📌 Final Rule

If it is hardcoded → ❌ WRONG
If structure is broken → ❌ WRONG
If ScreenUtil is not used → ❌ WRONG
If API is inside Bloc → ❌ WRONG

---