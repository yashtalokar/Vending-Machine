# Vending-Machine

## 1 Introduction
In this project, the objective was to build a simple chip to control a 4 item vending machine.

### 1.1 Machine Operation
 The machine operates as follows:
 | Item | Price |
 |-----|--------|
 |**Candy**|₹15|
 |**Snacks**|₹20|
 |**Popcorn**|₹25|
 |**Can**|₹30|
 
- The machine only accepts ₹5 and ₹10 coin, with a maximum of one coin entered at each cycle.
- The machine returns the change if there is any.
- The machine also allows the user to change the selected item in between i.e. before the item is dispatched.

### 1.2 Chip Specifications
The chip must have the following specs:
- Two input bits; **five_rup** is high if the entered coin is ₹5, and **ten_rup** is high if the entered coin is ₹10. If no coin is inserted, both inputs are low.
- Two output bits; **product** is high when a can is to be output, and **change** is high if there is a change.
- An externally supplied **Reset** signal, is applied to restore the machine to it's ideal state.
- Works at ...................................MHz.
