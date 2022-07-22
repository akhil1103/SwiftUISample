# SwiftUISample: Demonstarted SwiftUI with MVVM architecture + Unit test cases

### 1. Filtering buttons

Added a horizontally scrolling view with buttons for the different categories (shopping, entertainment, food, etc). When the user taps on each of these, the list below should show only the transactions for the selected category.
<img width="473" alt="Screenshot 2022-07-22 at 5 08 31 PM" src="https://user-images.githubusercontent.com/8705862/180480196-c0fd5b79-1eaf-4964-8592-b6fb47fde720.png">

### 2. Floating sum view 

A floating view at the bottom of the list displaying the sum for the transactions belonging to the selected category. The sum gets update when the user chooses the different categories.

### 3. Pin/Unpin action to each transaction

By tapping on an transaction, the UI should blend/unblend accordingly. The sum in the floating view at the bottom is only considering pinned transactions.
<img width="473" alt="Screenshot 2022-07-22 at 5 08 45 PM" src="https://user-images.githubusercontent.com/8705862/180480232-3b535127-ac32-4a43-9212-1942cccef7d9.png">

### 4. Update the chart and list in the insights tab to reflect expense in each category

The insights view will only consider pinned transactions.
<img width="473" alt="Screenshot 2022-07-22 at 5 08 36 PM" src="https://user-images.githubusercontent.com/8705862/180480249-89cd4249-47c9-401f-94ae-bbd99a94352e.png">

### 5. Unit tests 

Unit Test cases for: 

- filtering of transactions according to category
- sum of transaction amounts for filtered category
