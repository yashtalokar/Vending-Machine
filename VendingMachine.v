module Item_One(
  input five_rup,ten_rup,clk,rst,
  output reg product, change
);
  reg [2:0] curr_state, next_state;
  
  parameter S0  = 3'b001,
            S5  = 3'b010,
            S10 = 3'b100;
  
  always @(posedge clk or posedge rst or posedge five_rup or posedge ten_rup)
    begin
      if(rst) begin curr_state <= S0;{product, change} = 2'b00; end 
      else begin //curr_state <= next_state;

      case(curr_state)
        S0:
          if(five_rup)     begin next_state = S5; {product, change} = 2'b00; end
          else if(ten_rup) begin next_state = S10;{product, change} = 2'b00; end 
          else             begin next_state = S0; {product, change} = 2'b00; end
        
        S5:
          if(five_rup)     begin next_state = S10;{product, change} = 2'b00; end
          else if(ten_rup) begin next_state = S0; {product, change} = 2'b10; end 
          else             begin next_state = S5; {product, change} = 2'b00; end
        
        S10:
          if(five_rup)     begin next_state = S0; {product, change} = 2'b10; end
          else if(ten_rup) begin next_state = S0; {product, change} = 2'b11; end 
          else             begin next_state = S10;{product, change} = 2'b00; end
        
        default:           
          begin next_state = S0; {product, change} = 2'b00; end
               
      endcase
      curr_state <= next_state;
    end
  end
endmodule

module Item_Two(
  input five_rup,ten_rup,clk,rst,
  output reg product, change
);
  reg [3:0] curr_state, next_state;
  
  parameter S0  = 4'b0001,
            S5  = 4'b0010,
            S10 = 4'b0100,
            S15 = 4'b1000;
  
  always @(posedge clk or posedge rst or posedge five_rup or posedge ten_rup)
    begin
      if(rst) begin curr_state <= S0; {product, change} = 2'b00; end
      else  begin //curr_state <= next_state;
  
      case(curr_state)
        S0:
          if(five_rup)     begin next_state = S5; {product, change} = 2'b00; end
          else if(ten_rup) begin next_state = S10;{product, change} = 2'b00; end 
          else             begin next_state = S0; {product, change} = 2'b00; end
        
        S5:
          if(five_rup)     begin next_state = S10; {product, change} = 2'b00; end
          else if(ten_rup) begin next_state = S15; {product, change} = 2'b00; end 
          else             begin next_state = S5;  {product, change} = 2'b00; end
        
        S10:
          if(five_rup)     begin next_state = S15; {product, change} = 2'b00; end
          else if(ten_rup) begin next_state = S0;  {product, change} = 2'b10; end 
          else             begin next_state = S10; {product, change} = 2'b00; end
        
        S15:
          if(five_rup)     begin next_state = S0;  {product, change} = 2'b10; end
          else if(ten_rup) begin next_state = S0;  {product, change} = 2'b11; end 
          else             begin next_state = S15; {product, change} = 2'b00; end
        
        default:  
          begin next_state = S0; {product, change} = 2'b00; end
        
       
      endcase
      curr_state <= next_state;
      end
    end
endmodule          
  

module Item_Three(
  input five_rup,ten_rup,clk,rst,
  output reg product, change
);
  reg [4:0] curr_state, next_state;
  
  parameter S0  = 5'b00001,
            S5  = 5'b00010,
            S10 = 5'b00100,
            S15 = 5'b01000,
            S20 = 5'b10000;
  
  always @(posedge clk or posedge rst or posedge five_rup or posedge ten_rup)
    begin
      if(rst) begin curr_state <= S0; {product, change} = 2'b00; end
      else begin //curr_state <= next_state;
   
      case(curr_state)
        S0:
          if(five_rup)     begin next_state = S5; {product, change} = 2'b00; end
          else if(ten_rup) begin next_state = S10;{product, change} = 2'b00; end 
          else             begin next_state = S0; {product, change} = 2'b00; end
        
        S5:
          if(five_rup)     begin next_state = S10; {product, change} = 2'b00; end
          else if(ten_rup) begin next_state = S15; {product, change} = 2'b00; end 
          else             begin next_state = S5;  {product, change} = 2'b00; end
        
        S10:
          if(five_rup)     begin next_state = S15; {product, change} = 2'b00; end
          else if(ten_rup) begin next_state = S20; {product, change} = 2'b00; end 
          else             begin next_state = S10; {product, change} = 2'b00; end
        
        S15:
          if(five_rup)     begin next_state = S20; {product, change} = 2'b00; end
          else if(ten_rup) begin next_state = S0;  {product, change} = 2'b10; end 
          else             begin next_state = S15; {product, change} = 2'b00; end
        
        S20:
          if(five_rup)     begin next_state = S0;  {product, change} = 2'b10; end
          else if(ten_rup) begin next_state = S0;  {product, change} = 2'b11; end 
          else             begin next_state = S20; {product, change} = 2'b00; end
        
        default:  
          begin next_state = S0; {product, change} = 2'b00; end
        
      endcase
      curr_state <= next_state;
      end
    end
endmodule

        
module Item_Four(
  input five_rup,ten_rup,clk,rst,
  output reg product, change
);
  reg [5:0] curr_state, next_state;
  
  parameter S0  = 6'b000001,
            S5  = 6'b000010,
            S10 = 6'b000100,
            S15 = 6'b001000,
            S20 = 6'b010000,
            S25 = 6'b100000;
  

  always @(posedge clk or posedge five_rup or posedge ten_rup or posedge rst )
    begin
      if(rst) begin curr_state <= S0; next_state <= S0; {product, change} = 2'b00; end
        else begin //curr_state <= next_state;
          
          case(curr_state)
            S0:
              if(five_rup)     begin next_state = S5; {product,change} = 2'b00; end
              else if(ten_rup) begin next_state = S10;{product,change} = 2'b00; end 
              else             begin next_state = S0; {product,change} = 2'b00; end 
               
            S5:
              if(five_rup)     begin next_state = S10; {product,change} = 2'b00; end
              else if(ten_rup) begin next_state = S15; {product,change} = 2'b00; end 
              else             begin next_state = S5;  {product,change} = 2'b00; end
                           
            S10:
             if(five_rup)     begin next_state = S15; {product,change} = 2'b00; end
             else if(ten_rup) begin next_state = S20; {product,change} = 2'b00; end 
             else             begin next_state = S10; {product,change} = 2'b00; end
        
            S15:
              if(five_rup)     begin next_state = S20; {product,change} = 2'b00; end
              else if(ten_rup) begin next_state = S25; {product,change} = 2'b00; end 
              else             begin next_state = S15; {product,change} = 2'b00; end
        
            S20:
              if(five_rup)     begin next_state = S25; {product,change} = 2'b00; end
              else if(ten_rup) begin next_state = S0;  {product,change} = 2'b10; end 
              else             begin next_state = S20; {product,change} = 2'b00; end
        
            S25:
              if(five_rup)     begin next_state = S0;  {product,change} = 2'b10; end
              else if(ten_rup) begin next_state = S0;  {product,change} = 2'b11; end 
              else             begin next_state = S25; {product,change} = 2'b00; end
        
        
            default:
              begin next_state = S0; {product, change} = 2'b00; end
          
          endcase
          curr_state <= next_state;
        end
    end
endmodule        
              

module VendingMachine(
  input [3:0] item_no,
  input five_rup,ten_rup,clk,rst,
  output reg product=0, change
);
  wire no1,no2,no3,no4,c1,c2,c3,c4;
  
 
  Item_One I1(.five_rup(five_rup), .ten_rup(ten_rup), .clk(clk), .rst(rst), .product(no1), .change(c1));
  Item_Two I2(.five_rup(five_rup), .ten_rup(ten_rup), .clk(clk), .rst(rst), .product(no2), .change(c2));
  Item_Three I3(.five_rup(five_rup), .ten_rup(ten_rup), .clk(clk), .rst(rst), .product(no3), .change(c3));
  Item_Four I4(.five_rup(five_rup), .ten_rup(ten_rup), .clk(clk), .rst(rst), .product(no4), .change(c4));
  
  
  always @(*) begin
    case(item_no)
      4'b0001: begin
        {product,change} = {no1,c1};
      end
      
      4'b0010: begin 
        {product,change} = {no2,c2};
      end
      
      4'b0100: begin 
        {product,change} = {no3,c3}; 
      end
      
      4'b1000: begin 
        {product,change} = {no4,c4};
      end 
    endcase
  end
endmodule
      