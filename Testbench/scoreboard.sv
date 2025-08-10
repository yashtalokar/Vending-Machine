class vending_scb;
  mailbox mon2scb;
  int no_of_transaction = 0;

  // Internal state variables for reference FSM
  typedef enum logic [4:0] {
    S0   = 5'b00000,
    S5   = 5'b00001,
    S10  = 5'b00010,
    S15  = 5'b00100,
    S20  = 5'b01000,
    S25  = 5'b10000
  } state_t;

  state_t curr_state, next_state;

  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
    curr_state   = S0;
  endfunction

  // Reference model for expected product/change
  function void ref_model(input bit five_rup, ten_rup,
                          input bit [3:0] item_no,
                         output bit exp_product, exp_change);
    exp_product = 0;
    exp_change  = 0;
    next_state  = curr_state;

    case (item_no)
      4'b0001: begin // Item_One cost = 10
        case (curr_state)
          S0:  if (five_rup) next_state = S5;
               else if (ten_rup) next_state = S10;
          S5:  if (five_rup) next_state = S10;
               else if (ten_rup) begin next_state = S0; exp_product = 1; end
          S10: if (five_rup) begin next_state = S0; exp_product = 1; end
               else if (ten_rup) begin next_state = S0; exp_product = 1; exp_change = 1; end
        endcase
      end

      4'b0010: begin // Item_Two cost = 15
        case (curr_state)
          S0:  if (five_rup) next_state = S5;
               else if (ten_rup) next_state = S10;
          S5:  if (five_rup) next_state = S10;
               else if (ten_rup) next_state = S15;
          S10: if (five_rup) next_state = S15;
               else if (ten_rup) begin next_state = S0; exp_product = 1; end
          S15: if (five_rup) begin next_state = S0; exp_product = 1; end
               else if (ten_rup) begin next_state = S0; exp_product = 1; exp_change = 1; end
        endcase
      end

      4'b0100: begin // Item_Three cost = 20
        case (curr_state)
          S0:  if (five_rup) next_state = S5;
               else if (ten_rup) next_state = S10;
          S5:  if (five_rup) next_state = S10;
               else if (ten_rup) next_state = S15;
          S10: if (five_rup) next_state = S15;
               else if (ten_rup) next_state = S20;
          S15: if (five_rup) next_state = S20;
               else if (ten_rup) begin next_state = S0; exp_product = 1; end
          S20: if (five_rup) begin next_state = S0; exp_product = 1; end
               else if (ten_rup) begin next_state = S0; exp_product = 1; exp_change = 1; end
        endcase
      end

      4'b1000: begin // Item_Four cost = 25
        case (curr_state)
          S0:  if (five_rup) next_state = S5;
               else if (ten_rup) next_state = S10;
          S5:  if (five_rup) next_state = S10;
               else if (ten_rup) next_state = S15;
          S10: if (five_rup) next_state = S15;
               else if (ten_rup) next_state = S20;
          S15: if (five_rup) next_state = S20;
               else if (ten_rup) next_state = S25;
          S20: if (five_rup) next_state = S25;
               else if (ten_rup) begin next_state = S0; exp_product = 1; end
          S25: if (five_rup) begin next_state = S0; exp_product = 1; end
               else if (ten_rup) begin next_state = S0; exp_product = 1; exp_change = 1; end
        endcase
      end
    endcase
  endfunction

  task run();
    vending_txn t;
    bit exp_p, exp_c;

    forever begin
      mon2scb.get(t);
      ref_model(t.five_rup, t.ten_rup, t.item_no, exp_p, exp_c);

      if ((t.exp_product !== exp_p) || (t.exp_change !== exp_c))
        $display("[SCB][FAIL] Item=%0d Got: Product=%0b Change=%0b Exp: Product=%0b Change=%0b",
                  t.item_no, t.exp_product, t.exp_change, exp_p, exp_c);
      else
        $display("[SCB][PASS] Item=%0d Output matches expected", t.item_no);

      curr_state = next_state;
      no_of_transaction ++;
    end
  endtask
endclass
