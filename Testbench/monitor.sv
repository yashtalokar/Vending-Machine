class vending_mon;
  virtual vending_if vif;
  mailbox mon2scb;

  function new(virtual vending_if vif, mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction

  task run();
    vending_txn t;
    forever begin
      @(posedge vif.clk);
      t = new();
      t.five_rup   = vif.five_rup;
      t.ten_rup    = vif.ten_rup;
      t.item_no    = vif.item_no;
      t.exp_product = vif.product;
      t.exp_change  = vif.change;
     // t.display("Monitor");
      mon2scb.put(t);
      t.cg.sample();
     
    end
  endtask
endclass
