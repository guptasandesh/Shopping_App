A clean, modern shopping application built using Flutter.
This project demonstrates real-world mobile development concepts including multi-screen navigation, UI composition, dynamic state handling, and user interaction patterns.
Developed as part of my learning journey, applying concepts from layouts to state management.

------------------------------------------------------------------------------------------------------------------------------------------

🚀 **Features:**


**Home Screen with Product Catalog**
Displaying product image, name, price, and category chips.


**Product Details Screen**
Clean UI with large product image, price, description layout, and spacing using Column, Row, Spacer, and Expanded.


**Dynamic Size Selection**
Interactive size chips with active selection highlight.


**Add to Cart Functionality**

Adds item with selected size

Shows snackbar confirmation

Prevents adding items when no size is selected


**Cart Page**
Displays items with selected size and price.


**Delete Item with Confirmation Dialog**
Prevents accidental removal using AlertDialog.


**Bottom Navigation Bar**
Smooth switching between Home and Cart tabs using IndexedStack.


**Reusable Widgets + Organized File Structure**
Following best practices from the Flutter course.

----------------------------------------------------------------------------------------------------------------------------
**🛠️ Flutter Concepts Used**


**UI & Layout**

Row, Column, Flex, Spacer, Expanded

ClipRRect, Card, Image.asset

Padding vs Margin

SafeArea

SingleChildScrollView

TextStyle, Colors, MaterialApp


**Intermediate Concepts**

InheritedWidget (theming theory)

LayoutBuilder & MediaQuery for responsive design

Widget extraction

BuildContext understanding

Lifecycle methods (initState, dispose)


**State & Async**

Provider state management

Future, async/await (used in Weather App learning)

Snackbars & error handling


**Navigation**

Navigator behind the scenes

Passing arguments

Routing structure


**App Architecture**

Dummy data models

Reusable components

Clear file structure

--------------------------------------------------------------------------------------------------------------------

📸 **Screenshots**


![Home Page](images/home.png)
![Product Details](images/product_details.png)
![Cart Page](images/cart.png)

-------------------------------------------------------------------------------------------------------------------

📦 **Getting Started**


**Clone the repo:**


git clone https://github.com/YOUR_USERNAME/shopping_app_flutter.git


**Install packages:**


flutter pub get


**Run the app:**

flutter run

----------------------------------------------------------------------------------------------------------------------

**📄 About**


A Flutter shopping app demonstrating real UI design, navigation, dialogs, size selection, cart logic, and state management.
Built as a practical milestone while learning Flutter end-to-end.
