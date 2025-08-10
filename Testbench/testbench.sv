`include "interface.sv"
`include "environment.sv"

module top;
  bit clk;
  always #5 clk = ~clk;

  vending_if vif(clk);
  
  VendingMachine dut(
    .clk(clk),
    .rst(vif.reset),
    .five_rup(vif.five_rup),
    .ten_rup(vif.ten_rup),
    .item_no(vif.item_no),
    .product(vif.product),
    .change(vif.change)
  );

  vending_env env;

  initial begin
    vif.reset = 1;
    repeat (2) @(posedge clk);
    vif.reset = 0;
    vif.item_no = 4'b0001;
  end
  
  initial begin
    env = new(vif);
    env.gen.repeat_count = 80;
    fork
      env.run();
     
      forever begin
        vif.item_no = 4'b0001; 
        #200;
        vif.item_no = 4'b0010; 
        #200;
        vif.item_no = 4'b0100;
        #200;
        vif.item_no = 4'b1000;
        #200;
      end
    join
  end

  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
