# invesQ

A Flutter project for managing expenses with OCR-based receipt parsing.

---

## Getting Started

This project is a starting point for a Flutter application.

Some resources if you are new to Flutter:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter Documentation](https://docs.flutter.dev/)

---

### Clone Repository

```bash
# Clone the project
git clone https://github.com/Krinal73/invesQ.git
cd invesQ

# Install dependencies
flutter pub get

# Generate .g.dart and .freezed.dart files
flutter pub run build_runner build --delete-conflicting-outputs

# OR watch for changes continuously during development
flutter pub run build_runner watch --delete-conflicting-outputs

# Run the app
flutter run

Project Architecture

The app follows the BLoC (Business Logic Component) pattern:

UI Layer: Screens/widgets for user interaction

Event Layer: Defines user actions (e.g., SubmitExpenseEvent)

Bloc Layer: Handles events, performs validation, calls repositories, emits new states

Repository Layer: Handles all API calls (UI never calls API directly)

State Layer: Holds current data, validation errors, API responses, and loading statuses

Reactive Updates: UI listens to state changes and rebuilds automatically

General App Flow
User Action (UI)
      │
      ▼
Event Sent to Bloc
      │
      ▼
Bloc Processes Event
  ├─ Validation
  ├─ Repository/API Calls
  ├─ Local Logic (e.g., OCR Parsing)
      │
      ▼
Bloc Emits New State
      │
      ▼
UI Rebuilds Automatically

Folder Structure 
lib/
├─ main.dart                # App entry point
├─ api/                     # API-related files
│  ├─ api_urls.dart         # Base API URLs
│  └─ http_logging_interceptor.dart  # HTTP interceptor
├─ api_client/              # API client setup
│  └─ api_client.dart
├─ repository/              # Handles API calls
│  ├─ lead_repository/
│  └─ user_repository/
├─ models/                  # Base data models
│  ├─ api_base_response.dart
│  ├─ api_base_resource.dart
│  └─ http_header_response_model.dart
├─ bloc_provider_observer/  # Global Bloc observer & shared blocs
│  └─ app_bloc_observer.dart
├─ routes/                  # App navigation (GetX)
│  └─ routes.dart           # Contains all routes (Login, Profile, Base, Lead, Expense)
├─ ui/                      # All screens/pages
│  ├─ profile_screen/
│  │  ├─ bloc/              # Bloc, events, states
│  │  ├─ model/             # Form inputs specific to screen
│  │  └─ view/              # UI widgets and screen
│  │     ├─ profile_screen.dart
│  │     └─ profile_view.dart
│  └─ expense_screen/       # Similar structure for ExpenseScreen
├─ widgets/                 # Reusable widgets (buttons, text fields)
├─ utils/                   # Utilities (OCR parser, enums, colors)


## OCR (Optical Character Recognition) Implementation

The app includes a **custom OCR parser** to automatically extract expense details from receipt images. This ensures minimal manual input and faster expense entry.

### Workflow

1. **User Action:**  
   User selects or captures a receipt image from the camera or gallery.

2. **Image Handling:**
    - Image is sent to the `ExpenseBloc` via the `PickReceiptImageEvent`.
    - Loading indicator is shown while OCR processes the image.

3. **Text Extraction:**
    - The image is processed by `ExpenseOCRParser`.
    - OCR identifies all text lines from the receipt.

4. **Data Parsing:**  
   The parser extracts:
    - **Title:** First meaningful line of the receipt (length > 5 characters).
    - **Amount:** Uses regex to detect numeric values and currency symbols (₹, $, etc.).
    - **Date:** Extracted if available; otherwise, user selects manually.
    - **Category:** Dropdown selection (`Travel`, `Food`, `Office`, `Other`).
    - **Notes:** Optional, can be added manually.

5. **Form Population:**  
   Extracted data is automatically filled into the form fields (`TextFormFieldWidget` and dropdowns). Users can edit before submitting.

6. **Validation:**  
   On pressing **Save Expense**, the app validates all required fields:
    - Title, Amount, Date, Category, and Image must be filled.
    - Errors are displayed in the UI if any field is empty.

7. **Submission:**  
   After validation, the expense data along with the receipt image is saved locally or via API depending on setup.

---

### Key Classes

- `ExpenseOCRParser` → Handles text extraction and parsing logic.
- `ExpenseBloc` → Manages state and events for OCR, form data, and submission.
- `PickReceiptImageEvent` → Triggers OCR processing when an image is picked.
- `ExpenseState` → Holds extracted data, OCR status, and validation errors.

---

### OCR Status Handling

The `ExpenseState` tracks OCR processing using the `OCRStatus` enum:

```dart
enum OCRStatus { initial, loading, success, failure }

Build & Run Notes

Generate .g.dart and .freezed.dart files:

flutter pub run build_runner build --delete-conflicting-outputs


Continuous generation during development:

flutter pub run build_runner watch --delete-conflicting-outputs


Run the app:

flutter run