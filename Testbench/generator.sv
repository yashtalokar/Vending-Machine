class vending_gen;
  mailbox gen2drv;
  
  rand vending_txn t;
  int repeat_count=0;
  
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction

  task run();
    repeat (repeat_count) begin
    t = new();
    assert(t.randomize) else $fatal("Coin randomization failed");
    gen2drv.put(t);
          
  end
endtask

endclass
