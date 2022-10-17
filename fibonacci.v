// Create a verilog program to print fibonacci series

module fibonacci(input clock, reset, input [7:0] num, output [19:0] fib_num);
  reg [19:0] prev, curr;
  reg [7:0] count;
  reg num_ready;
  
  always@(posedge reset) begin
    prev <= 'd0;
    curr <= 'd1;
    count <= 'd1;
  end
  
  always@(posedge clock) begin
    count <= count + 1;
    curr <= curr + prev;
    prev <= curr;
    if(count == (num - 2))
      num_ready <= 1;
    else
      num_ready <= 0;
  end
  
  assign fib_num = curr;
  
  always@(num_ready)
    if(num_ready)
      $display(" %d th Fibonacci Number is %d", num, fib_num);
  
endmodule
