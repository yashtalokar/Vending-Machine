`include "environment.sv"
program vending_test(vending_if vif);
  vending_env env;

  initial begin
    env = new(vif);
    env.run();
  end
endprogram