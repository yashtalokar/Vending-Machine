class vending_drv;
  virtual vending_if vif;
  mailbox gen2drv;
  int no_of_transaction = 0;

  function new(virtual vending_if vif, mailbox gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction

  task run();
    vending_txn t;
    forever begin
      gen2drv.get(t);
      vif.five_rup <= t.five_rup;
      vif.ten_rup  <= t.ten_rup;     
      @(posedge vif.clk); 
      no_of_transaction++;
    end
  endtask
endclass
