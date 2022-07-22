# SwiftUISample: Demonstarted SwiftUI with MVVM architecture + Unit test cases

### 1. Filtering buttons

Added a horizontally scrolling view with buttons for the different categories (shopping, entertainment, food, etc). When the user taps on each of these, the list below should show only the transactions for the selected category.

### 2. Floating sum view 

A floating view at the bottom of the list displaying the sum for the transactions belonging to the selected category. The sum gets update when the user chooses the different categories.

### 3. Pin/Unpin action to each transaction

By tapping on an transaction, the UI should blend/unblend accordingly. The sum in the floating view at the bottom is only considering pinned transactions.

### 4. Update the chart and list in the insights tab to reflect expense in each category

The insights view will only consider pinned transactions.

### 5. Unit tests 

Unit Test cases for: 

- filtering of transactions according to category
- sum of transaction amounts for filtered category
