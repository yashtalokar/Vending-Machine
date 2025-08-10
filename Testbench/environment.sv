`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class vending_env;
  vending_gen gen;
  vending_drv drv;
  vending_mon mon;
  vending_scb scb;

  mailbox gen2drv;
  mailbox mon2scb;
  virtual vending_if vif;

  function new(virtual vending_if vif);
    this.vif = vif;
    gen2drv = new();
    mon2scb = new();
    gen = new(gen2drv);
    drv = new(vif, gen2drv);
    mon = new(vif, mon2scb);
    scb = new(mon2scb);
  endfunction

  task rrun();
    fork
      gen.run();
      drv.run();
      mon.run();
      scb.run();
    join_any
  endtask
  
  task post_test();
    wait(gen.repeat_count == drv.no_of_transaction);
    wait(gen.repeat_count == scb.no_of_transaction);
  endtask
  
  task run();
    rrun();
    post_test();
    $display("=== FUNCTIONAL COVERAGE ===");
    $display("Functional Coverage = %0.2f%%", $get_coverage()); 
    $finish;
  endtask
    
endclass
