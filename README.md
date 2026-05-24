# My Shop Flutter Shopping App

A clean, responsive Flutter shopping app that lets users browse fruits and vegetables, manage quantities, and view a live order summary — all in a simple and intuitive UI.

---

## Screenshots

![alt text](image.png)
![alt text](image-1.png)

---

## Features

- Browse items organized by category (Fruits & Vegetables) using a tab bar
- Add items to cart with a single tap
- Increase or decrease item quantity with +/− controls
- Live footer showing each item's subtotal, total quantity, and total amount
- Clean UI with consistent styling across the app

---

## Project Structure

```
lib/
├── main.dart           # App entry point
├── main_screen.dart    # Main screen with tab bar and item lists
├── custom_items.dart   # Reusable item card widget
├── footer_view.dart    # Cart summary footer
└── item.dart           # Item model and ItemType enum
```

---

## Getting Started

### Prerequisites

Make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.0 or higher)
- Dart SDK (comes with Flutter)
- Android Studio or VS Code with Flutter extension
- An emulator or a physical device

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/MaysamMB/shop_test_app.git
   cd shop_test_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

   Or choose a specific device:

   ```bash
   flutter run -d chrome        # Web
   flutter run -d emulator-5554 # Android emulator
   ```

---

## How It Works

### Item Model (`item.dart`)

Each item has a `name`, `image` URL, `price`, `type` (fruit or vegetable), and a `quantity` that starts at 0.

### Main Screen (`main_screen.dart`)

Uses a `TabController` to switch between the Fruits and Vegetables lists. Each tab renders a `ListView` of `CustomItem` widgets. Whenever a quantity changes, `setState` is called to update the footer.

### Item Card (`custom_items.dart`)

Displays the item image, name, and price. If quantity is 0, a cart icon is shown to add the item. Once added, +/− buttons appear to control the quantity.

### Footer (`footer_view.dart`)

A fixed bottom panel that filters items with quantity > 0 and displays each item's subtotal, along with the total quantity and total amount.

---

## Built With

- [Flutter](https://flutter.dev/) — UI framework
- [Dart](https://dart.dev/) — Programming language

---

## Author

**Maysam Bradiya**  
Junior Frontend & Mobile Developer  
[GitHub](https://github.com/your-username) · [LinkedIn](https://linkedin.com/in/your-profile)

---

## License

This project is open source and available under the [MIT License](LICENSE).
