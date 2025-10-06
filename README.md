# MAD201-01 Cross Platform MA - Assignment 1

**Student:** Manpreet Singh  
**Student ID:** A00198842  

---

## 📖 Project Description

This project is a **Travel App** developed in **Flutter**.  
It demonstrates advanced usage of:

- Dart OOP (classes, constructors, methods, inheritance, collections, null safety)  
- Stateless & Stateful Widgets (custom reusable components)  
- Layouts with styling (Row, Column, Container, Stack, Flexible, Expanded)  
- Multiple navigation approaches (Navigator, Named Routes, Tabs, Drawer, BottomNavigationBar)  
- Passing & returning data between screens  
- Maintaining app-wide state without external packages  
- Additional features such as search, sort, visited badge overlay, and dark mode toggle  

The app contains:

- **Home Screen** → List of destinations with favorite toggle and navigation to details  
- **Details Screen** → Full info, mark as visited, add to favorites  
- **Profile Screen** → User info, visited destinations, statistics  
- **Bookings Screen** → Placeholder  
- **Settings Screen** → Dark mode toggle  
- **About Screen** → Static info  

---

## 📂 Branch Workflow

| Branch Name           | Description |
|-----------------------|-------------|
| feature/models       | Created base `Destination` model and subclasses `TouristDestination`, `CulturalDestination`. Added `UserProfile` model. |
| feature/repository   | Implemented `DestinationRepository` to store and manage destinations with required methods. |
| feature/screens      | Developed UI screens: HomeScreen, DetailsScreen, ProfileScreen, BookingsScreen, SettingsScreen, AboutScreen. |
| feature/navigation   | Added BottomNavigationBar, Drawer, Named Routes, and TravelAppState for state management. |
| feature/additional   | Added search bar, sort option, visited badge overlay, dark mode toggle, and return data feature. |

---

## ⚙ How to Run

1. Clone the repository:  
git clone https://github.com/manpreetgrewal1372/MAD201-ASSIGNMENT01-ManpreetSingh.git
2. Navigate to the project folder:  
cd MAD201-ASSIGNMENT01-ManpreetSingh
3. Get dependencies:  
flutter pub get
4. Run the app:  
flutter run
