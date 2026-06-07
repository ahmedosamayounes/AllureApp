# 🛒 E-Commerce App with Flutter & Firebase

An advanced, production-ready E-Commerce mobile application built using **Flutter** and **Firebase**. The project strictly adheres to **Clean Architecture** principles and uses a **Feature-First** structure, ensuring high scalability, maintainability, and clean state management.

---

## 🚀 Key Features

* **🔒 Secure Authentication:** Fully implemented Login and Sign-Up flows using **Firebase Authentication** alongside **Google Sign-In** integration.
* **📦 Dynamic Product Catalog:** Products are fetched dynamically from **Cloud Firestore** with high-resolution images stored securely in **Firebase Storage**.
* **🛒 Advanced Checkout Flow:** A seamless multi-step checkout experience including:
    * Dynamic total price calculations based on product quantities.
    * Shipping address management with reverse navigation callbacks.
    * Credit card detail forms using custom UI layers.
* **🧾 Real-time Order Placement:** Instant sync with Cloud Firestore to store and process customer orders dynamically.
* **📱 Fully Responsive UI:** Tailored perfectly for all mobile screen sizes using `flutter_screenutil`.
* **✨ Seamless UX Tools:** Sleek image carousels, custom SVG icons, and a native launch experience via `flutter_native_splash`.

---

## 🏗️ Architecture & Folder Structure

The project is structured around **Feature-First Clean Architecture**, separating global core components from individual features. This makes it highly optimized for team-based development.

```text
lib/
│
├── core/                         # Global Shared Layer (Independent of features)
│   ├── firebase_networking/       # Firebase Network clients, API Handlers & Error Catchers
│   ├── helpers/                  # Extensions and utility functions
│   ├── routing/                  # On-the-fly Application Routing mechanism
│   ├── shared/                   # Reusable global Custom Widgets (Buttons, Textfields, Appbar)
│   └── theming/                  # Global color palettes and text typography configurations
│
└── features/                     # Feature Layer (Encapsulated feature logic)
    ├── auth/                     # Auth feature (Login, Signup, AuthService, Shared Auth Widgets)
    ├── home/                     # Catalog browsing, dynamic product feeds, banners
    ├── checkout/                 # Order price monitoring and promotional handling
    └── place_order/              # Address syncing, credit card processing, and final order push
```
### 🔄 Data Flow Pattern

`UI (Widgets)` ➡️ `Bloc/Cubit (State Management)` ➡️ `Repository Layer` ➡️ `AuthService/Firebase Network Clients (Data Source)` ➡️ Returns `ApiResult<T>`

---

### 🛠️ Tech Stack & Dependencies
This app leverages modern industry-standard libraries to achieve state-of-the-art performance:

| Dependency | Purpose |
| :--- | :--- |
| **`flutter_bloc`** | State Management via Cubits enforcing clean unidirectional data flow. |
| **`firebase_core` & `auth`** | Cloud authentication handling for users and Google Auth. |
| **`cloud_firestore`** | NoSQL cloud database for products and transaction orders. |
| **`firebase_storage`** | Cloud infrastructure asset pipeline hosting product imagery. |
| **`freezed` & `json_annotation`** | Code generation for immutable states, data models, and JSON parsing. |
| **`get_it`** | Dependency Injection locator to manage singletons dynamically. |
| **`flutter_screenutil`** | Adapting screen and font sizes dynamically for cross-device responsiveness. |
| **`flutter_svg`** | High-fidelity scalar vector graphic rendering for app iconography. |
| **`gap`** | Elegant layout spacing tool improving code readability over Empty SizedBoxes. |

---

## 📸 Screenshots & UI Tour

### 🔐 Part 1: Authentication & Browsing
| Signup Screen | Signup Success | Login Screen | Google Sign-In |
| :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/fcd42db4-8f8f-49ba-91ab-3ba879243984" width="200"/> | <img src="https://github.com/user-attachments/assets/388d4a75-12eb-4ee8-9b0d-dd6b123ac9ad" width="200"/> | <img src="https://github.com/user-attachments/assets/e33e137c-06c3-4dd0-8d37-97083a2fe860" width="200"/> | <img src="https://github.com/user-attachments/assets/eab7ebbd-4d39-4614-b0c6-c8727fc79d14" width="200"/> |
| Home / Products | Navigation Drawer | Checkout Summary | Place Order Summary |
| <img src="https://github.com/user-attachments/assets/5c3bd365-b426-4bc2-8319-791621bd9fed" width="200"/> | <img src="https://github.com/user-attachments/assets/2d0c6393-8eff-431f-a9f1-ad9df81fcfff" width="200"/> | <img src="https://github.com/user-attachments/assets/e975e03d-7e9c-42a0-b26a-618aabb6480f" width="200"/> | <img src="https://github.com/user-attachments/assets/f86148b3-f1c9-4c7b-aee4-fa525ce61e90" width="200"/> |

### 💳 Part 2: Order Placement & Checkout Flow
| Add Shipping Address | Credit Card Payment | Order Placement Details | Order Placed Successfully |
| :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/18d49424-edf8-43af-8902-ed6e61cef280" width="200"/> | <img src="https://github.com/user-attachments/assets/5d4c9299-81e5-4fb1-8ff8-d81fa96cf403" width="200"/> | <img src="https://github.com/user-attachments/assets/6b6504ad-1da5-4567-842e-63746c1d7db3" width="200"/> | <img src="https://github.com/user-attachments/assets/860a8817-6435-4cc9-be65-77fe1c14144c" width="200"/> |
| <img src="YOUR_SCREENSHOT_LINK_HERE" width="220"/> <br> *Login & Signup Screens* | <img src="YOUR_SCREENSHOT_LINK_HERE" width="220"/> <br> *Dynamic Product Feed* | <img src="YOUR_SCREENSHOT_LINK_HERE" width="220"/> <br> *Address & Payment Management* |
