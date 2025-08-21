class vending_txn;
  rand bit five_rup;
  rand bit ten_rup;
       bit [3:0] item_no;

  bit product;
  bit change;
  
  constraint rupee {!(five_rup && ten_rup);}
  
  covergroup cg;
    c1: coverpoint five_rup;
    c2: coverpoint ten_rup;
    c3: coverpoint item_no {bins b1[] = {1,2,4,8};}
    c4: coverpoint product; 
    c5: coverpoint change;
    c6: cross five_rup, ten_rup, c3 {illegal_bins b1 = binsof(five_rup) intersect {1} && binsof(ten_rup) intersect {1};}
  endgroup
  
  function new();
    cg = new();
  endfunction
  
   
  function void display(string name);
    $display("-----------------------------");
    $display("%s", name);
    $display("TXN => five=%0b ten=%0b item=%0d", five_rup, ten_rup, item_no);
    $display("-----------------------------");
  endfunction
endclass
