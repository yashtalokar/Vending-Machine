
`define clock_period 10

// Module for the testbench
module VendingMachine_tb();
    // Defining the inputs and the outputs
    reg [3:0] item_no;
    reg five_rup, ten_rup, clk, rst;
    wire product,change;
    
    // Calling the module 
    VendingMachine VM(.item_no(item_no), .five_rup(five_rup), .ten_rup(ten_rup), .clk(clk), .rst(rst), .product(product), .change(change));

    // Intialising the clock value
    initial clk = 1;

    // Updating clock value
    always #(`clock_period/2) clk = (~clk);

    // Input beginning
    initial begin
        // Initialising the values
        item_no = 4'b0001;
        five_rup = 0;
        ten_rup = 0;
        rst = 0;


        #(`clock_period);
        five_rup = 1;
        ten_rup = 0;
        
        #(`clock_period*2);
        rst = 1;

        #(`clock_period);
        rst=0;
        
        five_rup = 1;
        ten_rup = 0;
      
        #(`clock_period*2);
        five_rup = 0;
        ten_rup = 1;
      
        #(`clock_period);
        five_rup = 1;
        ten_rup = 0;
      
      
        #(`clock_period);
        item_no = 4'b0010;
        five_rup = 1;
        ten_rup = 0;
      
      
        #(`clock_period);
        five_rup = 0;
        ten_rup = 1;
      
        #(`clock_period);
        rst = 1;
      
        #(`clock_period);
        rst = 0;
        five_rup = 0;
        ten_rup = 1;
      
      
        #(`clock_period*3);
        five_rup = 1;
        ten_rup = 0;
      
        #(`clock_period);
        rst = 1;
      
        #(`clock_period);

        #(`clock_period);
        $finish;
     
      
    end

    // Dumping the file and variables
    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars; 
    end
endmodule