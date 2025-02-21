# 📝 **FocusFlow: Flutter Task Management App**

**Description:**
FocusFlow is a simple and intuitive task management app built with Flutter. It allows users to create, view, edit, and delete tasks efficiently. The app utilizes the dummy JSON API ([https://dummyjson.com/todos](https://dummyjson.com/todos)) and follows clean architecture principles with state management using Flutter Bloc.

---

## 🚀 **Features**

- 🆕 **Create Tasks:** Add new tasks with titles and completion status.
- 📄 **View Tasks:** Display all tasks in a user-friendly list view.
- ✏️ **Edit Tasks:** Update task details quickly and easily.
- ❌ **Delete Tasks:** Remove tasks with a simple confirmation step.
- 🌗 **Dark Mode:** Toggle between light and dark themes seamlessly.

---

## 🖼️ **Screenshots**

| Home Screen | Add Task | Edit Task |
|-------------|-----------|-----------|
| ![Home](screenshots/home.png) | ![Add Task](screenshots/add_task.png) | ![Edit Task](screenshots/edit_task.png) |

---

## 📦 **Installation**

1. **Clone the repository:**
```bash
git clone https://github.com/OmarAyman85/FocusFlow.git
cd FocusFlow
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Run the app:**
```bash
flutter run
```

---

## 🔨 **Technologies Used**

- **Flutter:** 3.29.0
- **Dart:** 3.7.0
- **State Management:** Flutter Bloc
- **Networking:** http
- **Local Storage:** Cache

---

## 🧠 **Architecture**

FocusFlow follows **Clean Architecture** principles with **Flutter Bloc** for state management.

### Layers:

1. **Presentation:** UI and Bloc interactions.
2. **Domain:** Business logic and use cases.
3. **Data:** Repositories, API calls, and local storage.

---

## 📁 **Folder Structure**

```
lib/
│
├── core/                    # Global App features
│   ├── errors/                # Handling Failures and Exceptions
│   ├── network/               # Checking connectivity state
│   ├── usecases/              # Messages for failures and exceptions
│   ├── utils/                 # Snackbars and application theme
│   └── widgets/               # General widgets, e.g., Loading widget
├── features/                # Specific App features
│   └── task_manager/          # The task management feature and its components
│   │   └── data/                # Data Layer including API and Local storage
|   │   |   ├── datasources/       # Remote and local data sources
|   │   |   ├── models/            # Data models
|   │   |   └── repositories/      # Repository implementations
│   │   ├── domain/              # Business logic
|   │   │   ├── entities/          # Core entities
|   │   │   ├── repositories/      # Repository interfaces
|   │   │   └── usecases/          # Application use cases
│   │   ├── presentation/        # UI and Widgets
│   │   │   ├── bloc/              # State management using BLOC
│   │   │   ├── pages/             # App's pages
│   │   │   └── widgets/           # Reusable widgets
├── injection_container.dart   # Dependency Injection
└── main.dart                  # App entry point
```

---

## 🌐 **API Reference**

- **Base URL:** `https://dummyjson.com/todos`

### Fetch Tasks
```http
GET /todos
```

### Create Task
```http
POST /todos
```

### Update Task
```http
PUT /todos/{id}
```

### Delete Task
```http
DELETE /todos/{id}
```

---

## 🧪 **Running Tests**

```bash
flutter test
```

---

## 🤝 **Contributing**

1. **Fork the project**
2. **Create a feature branch:**
```bash
git checkout -b feature/YourFeature
```
3. **Commit your changes:**
```bash
git commit -m 'Add YourFeature'
```
4. **Push to the branch:**
```bash
git push origin feature/YourFeature
```
5. **Open a Pull Request**

---

## 📄 **License**

This project is licensed under the MIT License.

---

## 👤 **Author**

- **Name:** Omar Ayman
- **GitHub:** [@OmarAyman85](https://github.com/OmarAyman85)
- **LinkedIn:** [Omar Ayman](https://www.linkedin.com/in/ommarayman/)

---

