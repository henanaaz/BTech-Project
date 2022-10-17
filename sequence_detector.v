//Verilog code to detect a sequence 10110

module sequence_detector(seq_out, seq_in, clock, reset);
  output seq_out;
  input seq_in, clock, reset;
  
  reg[2:0] seq_state, next_state;
  parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100;
  
  always@(posedge clock) begin
    if(reset) begin
      seq_state <= s0;
      next_state <= s0;
    end
    else begin
      seq_state <= next_state;
    end
  end
  
  always@(seq_in or seq_state)
  case(seq_state)
    s0: if(seq_in)
          next_state <= s1;
        else
          next_state <= s0;
          
    s1: if(!seq_in)
          next_state <= s2;
        else
          next_state <= s1;
          
    s2: if(seq_in)
          next_state <= s3;
        else
          next_state <= s0;
          
    s3: if(seq_in)
          next_state <= s4;
        else
          next_state <= s2;
          
    s4: if(!seq_in)
          next_state <= s2;
        else
          next_state <= s1;
 endcase
 
 always@(seq_in or seq_state)
 case(seq_state)
    s4: if(!seq_in)
          seq_out = 1'b1;
        else
          seq_out = 1'b0;
        
    s0,s1,s2,s3: seq_out = 1'b0;
 endcase
endmodule
  
          
  
