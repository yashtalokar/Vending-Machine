`timescale 1ns/1ps

module Item_One(
  input  logic five_rup, ten_rup, clk, rst,
  input  logic [3:0] item_no,
  output logic product, change
);

  typedef enum logic [1:0] {S0=2'b00, S5=2'b01, S10=2'b10} state_t;
  state_t curr_state, next_state;

  // Sequential logic
  always_ff @(posedge clk or posedge rst) begin    
    if (rst)
      curr_state <= S0;
    else
      curr_state <= next_state;
  end
  
  always_comb begin 
    next_state = curr_state;
    product = 0;
    change  = 0;
    
    if (item_no == 4'b0001) begin
      case (curr_state)
        S0: begin 
          if (five_rup) next_state = S5;
          else if (ten_rup)   next_state = S10;
        end
        
        S5: begin 
          if (five_rup) next_state = S10;
          else if (ten_rup) begin next_state = S0; product = 1; end
        end
        
        S10: begin
          if (five_rup) begin next_state = S0; product = 1; end
          else if (ten_rup) begin next_state = S0; product = 1; change  = 1; end
        end
        
        default: next_state = S0;
      endcase
    end
   else next_state = S0; 
  end
endmodule


module Item_Two(
  input  logic five_rup, ten_rup, clk, rst,
  input  logic [3:0] item_no,
  output logic product, change
);

  typedef enum logic [2:0] {S0=3'b000, S5=3'b001, S10=3'b010, S15=3'b100} state_t;
  state_t curr_state, next_state;

  always_ff @(posedge clk or posedge rst) begin
    if(rst) curr_state <= S0;  
    else curr_state <= next_state;
    end
  
  always_comb begin 
    next_state = curr_state;
    product = 0;
    change  = 0;
    
    if (item_no == 4'b0010) begin
      case (curr_state)
        S0: begin 
          if (five_rup) next_state = S5;
          else if (ten_rup)   next_state = S10;
        end
        
        S5: begin 
          if (five_rup) next_state = S10;
          else if (ten_rup) next_state = S15;
        end
        
        S10: begin
          if (five_rup) next_state = S15; 
          else if (ten_rup) begin next_state = S0; product = 1; end
        end
        
        S15: begin
          if(five_rup)     begin next_state = S0; {product, change} = 2'b10; end
          else if(ten_rup) begin next_state = S0; {product, change} = 2'b11; end
          end
        
        default: next_state = S0;
      endcase
     end
    else next_state = S0; 
  end
endmodule


module Item_Three(
  input  logic five_rup, ten_rup, clk, rst,
  input  logic [3:0] item_no,
  output logic product, change
);

  typedef enum logic [3:0] {S0=4'b0000, S5=4'b0001, S10=4'b0010, S15=4'b0100, S20=4'b1000} state_t;
  state_t curr_state, next_state;
  
  always_ff @(posedge clk or posedge rst) begin
    if(rst) curr_state <= S0;  
    else curr_state <= next_state;
    end
  
  always_comb begin 
    next_state = curr_state;
    product = 0;
    change  = 0;
    
    if (item_no == 4'b0100) begin
      case (curr_state)
        S0: begin 
          if (five_rup) next_state = S5;
          else if (ten_rup)   next_state = S10;
        end
        
        S5: begin 
          if (five_rup) next_state = S10;
          else if (ten_rup) next_state = S15;
        end
        
        S10: begin
          if (five_rup)     next_state = S15; 
          else if (ten_rup) next_state = S20; 
        end
        
        S15: begin
          if(five_rup) next_state = S20;
          else if(ten_rup) begin next_state = S0; product = 1; end
          end
        
        S20: begin
          if(five_rup)     begin next_state = S0;  {product, change} = 2'b10; end
          else if(ten_rup) begin next_state = S0;  {product, change} = 2'b11; end
        end
        
        default: next_state = S0;
      endcase
     end
    else next_state = S0; 
  end
endmodule  
  

module Item_Four(
  input  logic five_rup, ten_rup, clk, rst,
  input  logic [3:0] item_no,
  output logic product, change
);

  typedef enum logic [4:0] {S0=5'b00000, S5=5'b00001, S10=5'b00010, S15=5'b00100, S20=5'b01000, S25=5'b10000} state_t;
  state_t curr_state, next_state;

  always_ff @(posedge clk or posedge rst) begin
    if(rst) curr_state <= S0;  
    else curr_state <= next_state;
    end
  
  always_comb begin 
    next_state = curr_state;
    product = 0;
    change  = 0;
    
    if (item_no == 4'b1000 && !rst) begin
      case (curr_state)
        S0: begin 
          if (five_rup) next_state = S5;
          else if (ten_rup)   next_state = S10;
        end
        
        S5: begin 
          if (five_rup) next_state = S10;
          else if (ten_rup) next_state = S15;
        end
        
        S10: begin
          if (five_rup)     next_state = S15; 
          else if (ten_rup) next_state = S20; 
        end
        
        S15: begin
          if(five_rup) next_state = S20;
          else if(ten_rup) next_state = S25;
          end
        
        S20: begin
          if(five_rup)     next_state = S25; 
          else if(ten_rup) begin next_state = S0; {product, change} = 2'b10; end
        end
        
        S25: begin
          if(five_rup)     begin next_state = S0;  {product, change} = 2'b10; end
          else if(ten_rup) begin next_state = S0;  {product, change} = 2'b11; end
        end
        
        default: next_state = S0;
      endcase
     end
    else next_state = S0; 
  end
endmodule 



module VendingMachine(
  input  logic [3:0] item_no,
  input  logic five_rup, ten_rup, clk, rst,
  output logic product, change
);

  logic no1, no2, no3, no4;
  logic c1, c2, c3, c4;

  Item_One   I1(.five_rup(five_rup), .ten_rup(ten_rup), .clk(clk), .rst(rst), .product(no1), .change(c1), .item_no(item_no));
  Item_Two   I2(.five_rup(five_rup), .ten_rup(ten_rup), .clk(clk), .rst(rst), .product(no2), .change(c2), .item_no(item_no));
  Item_Three I3(.five_rup(five_rup), .ten_rup(ten_rup), .clk(clk), .rst(rst), .product(no3), .change(c3), .item_no(item_no));
  Item_Four  I4(.five_rup(five_rup), .ten_rup(ten_rup), .clk(clk), .rst(rst), .product(no4), .change(c4), .item_no(item_no));

  always_comb begin
    case(item_no)
      4'b0001: {product, change} = {no1, c1};
      4'b0010: {product, change} = {no2, c2};
      4'b0100: {product, change} = {no3, c3};
      4'b1000: {product, change} = {no4, c4};
      default: {product, change} = 2'b00;
    endcase
  end
endmodule
