# Vending-Machine

## 1 Introduction
The project involved designing a vending machine that could dispense four different products with varying prices and has the additional feature of returning change when a higher denomination coin was inserted. The vending machine only accepts coins of denominations five and ten.

The design of the vending machine was accomplished through the creation of a Finite State Machine (FSM) model, which defined the machine's different states, inputs, and outputs, as well as the transitions between the states. The FSM model was implemented using Verilog code, which defined the different states and their corresponding logic for accepting coins, dispensing products, and returning change.

A test-bench was created to simulate different scenarios, such as different coin denominations and product selections, to ensure that the vending machine worked correctly. The testing process was successful in verifying the proper functioning of the vending machine.

This project required knowledge of Verilog, FSMs, and digital design principles and provided a challenging and rewarding opportunity to better understand how vending machines operate. The completed project was a functional and efficient vending machine that could dispense products and return change with ease.

### 1.1 Machine Operation
 The machine operates as follows:
 | Item | Price |
 |-----|--------|
 |**Candy**|₹15|
 |**Snacks**|₹20|
 |**Popcorn**|₹25|
 |**Coke**|₹30|
 
- The machine only accepts ₹5 and ₹10 coin, with a maximum of one coin entered at each cycle.
- The machine returns the change if there is any.
- The machine also allows the user to change the selected item in between i.e. before the item is dispatched.

### 1.2 Chip Specifications
The chip must have the following specs:
- Two input bits; **five_rup** is high if the entered coin is ₹5, and **ten_rup** is high if the entered coin is ₹10. If no coin is inserted, both inputs are low.
- Two output bits; **product** is high when a can is to be output, and **change** is high if there is a change.
- An externally supplied **Reset** signal, is applied to restore the machine to it's ideal state.
- Works at 100 MHz.

### 1.3 Schematic
![image](https://github.com/user-attachments/assets/0e4254c4-3136-4952-832a-5fdb7074fcb4)

### 1.4 Simulation Result
![image](https://github.com/user-attachments/assets/7b92e5f2-4d1a-499e-bc0b-ccf8b59638ff)

### 1.5 Future Scope
We can further add a termination button to the machine. This button would allow the user to terminate the purchase process and receive all the money back sequentially.

