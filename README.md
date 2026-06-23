# <img src="https://github.com/user-attachments/assets/e41b51fb-1562-43c4-b84a-f2f74c44b7dc" width="45" height="45" style="vertical-align: middle; border-radius: 8px;"/> Allure - Luxury E-Commerce Application

Allure is a luxury fashion e-commerce application built with Flutter and Firebase following Feature-First Clean Architecture principles.

The project demonstrates scalable architecture, reactive state management, Stripe payments, Firebase integrations, offline caching, and push notification workflows suitable for production-grade applications.

---

##  Tech Stack & Architecture Key Highlights

* **Architecture:** Feature-First Clean Architecture separating concerns into `Data`, `Domain`, and `Presentation` layers.
* **Dependency Injection:** Centralized initialization container utilizing **GetIt** to manage singletons and factory instances lifecycle dynamically.
* **State Management:** Stream-based event flow powered by **Flutter BLoC / Cubit** patterns with immutable states generated via `freezed`.
* **Database & Infrastructure:** Enterprise integration with **Cloud Firestore** supporting both dynamic transactional single-fetches and real-time event monitoring via reactive `Streams`. Media assets are hosted on **Firebase Storage**.
* **Local Persistence & Caching:** High-performance local storage powered by **Hive** to cache product catalogs and metadata locally, ensuring an offline-first experience and instant startup times in the product discovery module.
* **Security & Authentication:** Secure token gateway handling traditional Email/Password credentials alongside an integrated **Google Sign-In** OAuth ecosystem.
* **Payment Pipeline:** End-to-end payment settlement executing custom asynchronous network queries directly through the **Stripe Intents API** via **Dio**, managed by a native **Stripe SDK** user interface layer.
* **Push Notifications:** Deep-linked multi-state execution environment running asynchronous messaging via **Firebase Cloud Messaging (FCM)** and foreground **Flutter Local Notifications** wrappers.

---

##  Key Functional Modules (The Complete Feature Matrix)

### 1. Identity & Access Gateway (`auth`)
* Supports secure Email/Password registration and login pipelines.
* Integrated **Google Sign-In OAuth** handling server-side credential exchanges.
* Features a persistent reactive **AuthGate** wrapper to evaluate auth tokens on boot and stream users to the proper lifecycle layer.

### 2. Product Discovery & Real-Time Catalog (`home`)
* Fetches live, dynamic collections directly from **Cloud Firestore** using continuous reactive `Streams` to update items instantly.
* Backed by a **Hive local database persistence layer** that caches the catalog metadata, allowing seamless offline navigation and instant data rendering on app boot.
* Formats premium design tokens using responsive layouts with `flutter_screenutil`, `carousel_slider`, and the custom brand font **TenorSans**.
* Houses an optimized **Dynamic Search Engine** filtering Firestore indices dynamically on the client side.

### 3. Order Processing & Unified Checkout Pipeline (`checkout`)
* **Direct Purchase Flow:** Eliminates complex cart states by routing product selections instantly into a streamlined purchase layout.
* **Reactive Calculations:** Implements continuous real-time multiplication logic tracking active `quantity` alterations against `basePrice` fields, broadcasting updates instantly via standalone state scopes.
* **Stripe & Profile Integration:** Bundles multi-stage operations (Shipping Address payloads and native Stripe Payment Sheet processing) inside a single core module before committing data.
* **Firestore Transactions:** Pushes validated final order payloads (containing safe user metadata, calculated quantities, and payment indicators) into the active live Firestore `orders` index, outputting a transaction reference on completion.
* *Future Roadmap:* Employs localized visual layouts for promo-code validation gateways, structured for backend discount rule injections.

---

## 🏗️ Centralized Core Architecture & Services

The global `core` package isolates low-level infrastructure blueprints and framework dependencies away from functional business logic layers.

### 1. Unified Dependency Injection Container (`get_it`)
The injection matrix cleanly categorizes components into precise architectural execution phases:
* **External Infrastructures:** Wraps foundational packages like `FirebaseAuth`, `GoogleSignIn`, `FirebaseFirestore`, and `FirebaseStorage` into shared immutable layers.
* **Data Layer Resolution:** Mounts explicit implementation units (`RemoteDataSources` and `Repositories`) as `LazySingletons`.
* **State Allocation:** Implements standalone controllers (`LoginCubit`, `SignupCubit`, and `CheckoutCubit`) as transient instances via `registerFactory` to prevent memory leaks and stale state preservation across app lifecycles.

### 2. Centralized Declarative Routing Engine (`AppRouter`)
Implements strict route abstraction separating navigation commands from view layouts:
* **Multi-Bloc Injections:** Bundles distinct state contexts (like `LoginCubit` and `GoogleSignInCubit`) seamlessly into a clean, combined interface scope.
* **Unified State Scope:** Leverages a single `CheckoutCubit` context across the direct-purchase sequence, ensuring that real-time total updates, user credentials, and payment processes bind safely to the same structural transaction lifecycle.

### 3. Robust Asynchronous Messaging Setup (`NotificationService`)
Engineered a unified messaging management subsystem capable of tracking across multiple hardware application operational contexts:
* **Foreground Handling:** Intercepts live `RemoteMessage` streams using reactive observers, building custom banner definitions via `FlutterLocalNotificationsPlugin` instances utilizing high-importance channels with native audio configurations.
* **Background & Terminated Redirection:** Employs static top-level background task isolation loops (`_firebaseMessagingBackgroundHandler`). Leverages delayed post-boot initialization pipelines (`getInitialMessage`) paired with active routing lifecycle listeners (`onMessageOpenedApp`) to extract underlying data payload map keys (`screen`) and execute targeted navigation events.

### 4. Modern Native Payment Matrix (`PaymentManager`)
Bypasses basic hardcoded payment shells in favor of an integrated transaction processor. Implements automated decimal conversion multipliers to maintain currency consistency when exchanging safe parameters with external production endpoints (`Stripe Intents API`) via **Dio**.

### 5. Functional Network Result Wrapper & Error Framework
* **`ApiResult<T>`:** A type-safe functional boundary layer wrapped in a `freezed` variant union mechanism (`Success` / `Failure`), decoupling network transaction exceptions from UI compilation parameters.
* **`FirebaseErrorHandler`:** Aggregates native Exception matrices across multiple backend products (`FirebaseAuthException`, `FirebaseException`) into a centralized processing pipeline, mapping cryptic backend identification error strings into plain, reader-friendly messages.

---

## 📂 Project Tree Topology

```text
lib/
│
├── core/                           # Global Architectural Subsystems
│   ├── di/                         # dependency_injection.dart (App dependency locator)
│   ├── networking/                 # api_result.dart & firebase_error_handler.dart
│   ├── notifications/              # notification_service.dart (FCM orchestration engine)
│   ├── payment/                    # payment_manager.dart (Stripe Dio implementation gateway)
│   ├── routing/                    # routes.dart & app_router.dart (Navigation engine)
│   ├── shared/                     # Global UI primitives (Custom AppBars, Buttons, Dialogs)
│   └── theming/                    # Visual tokens, design themes, and brand font setups
│
└── features/                       # Independent Encapsulated Modules
    ├── auth/                       # Identity layer (Login, Sign-up, Google OAuth configurations)
    ├── home/                       # Product catalog discovery and index browsing
    └── checkout/                   # Core payment pipeline handling prices, cards, and orders

```
<br>


### Feature Structure Layout Example (`checkout`)
<br>

```text
features/checkout/
├── data/
│   ├── data_source/            # checkout_remote_data_source.dart (Firestore payloads)
│   └── repo/                   # checkout_repository_impl.dart (Contract fulfillment)
├── domain/
│   ├── repository/             # checkout_repository.dart (Pure abstract blueprint)
│   └── use_case/               # place_order_use_case.dart (Single-responsibility task)
└── presentation/
    ├── cubit/                  # checkout_cubit.dart & checkout_state.dart
    ├── screens/                # checkout_screen.dart & place_order_screen.dart
    └── widgets/                # Isolated functional modular sub-views


```
<br>



### Strict Architectural Lifecycle Flow
<br>


```text
[UI Trigger / Interaction] ──(Dispatches Call)──> [Cubit Controller]
                                                          │
                                               (Invokes Action UseCase)
                                                          │
                                                          ▼
[Remote Platform Engine] <──(Fulfills Contract)── [Repository Impl] <──(Calls Blueprint)── [Use Case Domain]
         │
 (Stripe / Firebase)
         │
         ▼
[Raw Data Stream Input] ──(Serializes Model)──> [Returns Pure Entity] ──> [Emits New State]

```
<br>


---

## 🚀 Getting Started

Follow these steps to set up and run **Allure** locally on your machine.

### 📋 Prerequisites

Before you begin, ensure you have the following installed and configured:
* **Flutter SDK:** Latest Stable Version (`flutter doctor` should be green).
* **Firebase CLI:** Installed and authenticated.
* **Stripe Account:** Access to the Stripe Dashboard for test API keys.

---

### 🛠️ Setup & Installation

Follow this step-by-step pipeline to initialize the project:

#### 1. Clone the Repository
```bash
git clone [https://github.com/ahmedosamayounes/AllureApp.git](https://github.com/ahmedosamayounes/AllureApp.git)
cd AllureApp

```
<br>


--

## 📸 Interface Demonstration

### 🔐 Part 1: Authentication Gateway
| 1. Splash Screen | 2. Sign Up Screen | 3. Sign Up Success |
| :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/db390f50-bb39-4133-80b9-3d9f7ee62025" width="240"> | <img src="https://github.com/user-attachments/assets/2b8cffeb-efb3-497b-9352-0210163ae3e3" width="240"> | <img src="https://github.com/user-attachments/assets/382f55fc-7288-4ada-9bfe-ab2e7a3510ef" width="240"> |

| 4. Login Screen | 5. Firebase Google Sign-In |
| :---: | :---: |
| <img src="https://github.com/user-attachments/assets/341bb7ca-5490-447f-ad67-0305c26f75f6" width="240"> | <img src="https://github.com/user-attachments/assets/36943eb4-e87f-4725-b1d5-f97414017d1f" width="240"> |

---

### 🛍️ Part 2: Product Discovery & Home Navigation
| 6. Home Screen Catalog | 7. Home Navigation Drawer | 8. Dynamic Search Engine |
| :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/f5d130d8-9ea7-4202-add3-601d173b3617" width="240"> | <img src="https://github.com/user-attachments/assets/3d4d0cc6-29de-4b5a-a088-bff07f571db5" width="240"> | <img src="https://github.com/user-attachments/assets/95f50ed2-d7b3-46ea-8c6e-c30a6bbe62e4" width="240"> |

---

### 💳 Part 3: Direct Checkout & Stripe Payment Pipeline
| 9. Checkout Screen | 10. Place Order (Pending) | 11. Add Shipping Address |
| :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/047f7a85-2290-487c-bf7c-32657b49185b" width="240"> | <img src="https://github.com/user-attachments/assets/4a6897b8-fddb-4e64-93de-69359a9f41db" width="240"> | <img src="https://github.com/user-attachments/assets/9f5e1fd5-88b1-4275-b249-87c93f45bdd8" width="240"> |

| 12. Stripe Payment Sheet | 13. Payment Success | 14. Place Order (Ready) | 15. Order Placed Successfully |
| :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/bc45a00f-4cfc-4088-943f-73d5f37045bd" width="180"> | <img src="https://github.com/user-attachments/assets/8883f001-3b2c-41a1-94a5-1e4b4ce0e5df" width="180"> | <img src="https://github.com/user-attachments/assets/a73e820d-8533-4a3a-b384-792876f5aefc" width="180"> | <img src="https://github.com/user-attachments/assets/cb62821b-71cc-4b63-b5cd-6d1c67d8f635" width="180"> |

