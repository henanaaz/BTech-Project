module up_display(clk,cathode,anode);
  input clk;
  output reg [6:0] cathode;
  output reg [3:0]anode;

  reg [25:0] counter,counter1;
  reg new_clk,new_clk1;
  reg x;
  reg [3:0] out1,out2;
  reg [6:0] s1,s2;


/// clk divider 50m to 1hz //////

        always@(posedge clk)
        if(counter1==25000000)
          begin
            counter1<=0;
            new_clk1<=1;
          end
          else
          begin
            counter1<=counter1+1;
            new_clk1<=0;
          end

        always@(posedge new_clk1)
        if(out1<10)
          out1=out1+1;
          else out1=0;

        ///  seconds display ///

        always@(posedge new_clk1)
        if(out2<6)
          begin
              case(out2)
                  0:begin
                  s2=7'b1000000;
              case(out1)
                  0:s1=7'b1000000;
                  1:s1=7'b1111001;
                  2:s1=7'b0100100;
                  3:s1=7'b0110000;
                  4:s1=7'b0011001;
                  5:s1=7'b0010010;
                  6:s1=7'b0000010;
                  7:s1=7'b0111000;
                  8:s1=7'b0000000;
                  9:s1=7'b0011000;
              endcase
          end
                  1:begin
                  s2=7'b1111001;
              case(out1)
                  0:s1=7'b1000000;
                  1:s1=7'b1111001;
                  2:s1=7'b0100100;
                  3:s1=7'b0110000;
                  4:s1=7'b0011001;
                  5:s1=7'b0010010;
                  6:s1=7'b0000010;
                  7:s1=7'b0111000;
                  8:s1=7'b0000000;
                  9:s1=7'b0011000;
              endcase
        end
                  2:begin
                  s2=7'b0100100;
               case(out1)
                  0:s1=7'b1000000;
                  1:s1=7'b1111001;
                  2:s1=7'b0100100;
                  3:s1=7'b0110000;
                  4:s1=7'b0011001;
                  5:s1=7'b0010010;
                  6:s1=7'b0000010;
                  7:s1=7'b0111000;
                  8:s1=7'b0000000;
                  9:s1=7'b0011000;
              endcase
        end
                3:begin
                s2=7'b0110000;
              case(out1)
                0:s1=7'b1000000;
                1:s1=7'b1111001;
                2:s1=7'b0100100;
                3:s1=7'b0110000;
                4:s1=7'b0011001;
                5:s1=7'b0010010;
                6:s1=7'b0000010;
                7:s1=7'b0111000;
                8:s1=7'b0000000;
                9:s1=7'b0011000;
              endcase
        end
              4:begin
              s2=7'b0011001;
           case(out1)
              0:s1=7'b1000000;
              1:s1=7'b1111001;
              2:s1=7'b0100100;
              3:s1=7'b0110000;
              4:s1=7'b0011001;
              5:s1=7'b0010010;
              6:s1=7'b0000010;
              7:s1=7'b0111000;
              8:s1=7'b0000000;
              9:s1=7'b0011000;
            endcase
        end
              5:begin
              s2=7'b0010010;
           case(out1)
              0:s1=7'b1000000;
              1:s1=7'b1111001;
              2:s1=7'b0100100;
              3:s1=7'b0110000;
              4:s1=7'b0011001;
              5:s1=7'b0010010;
              6:s1=7'b0000010;
              7:s1=7'b0111000;
              8:s1=7'b0000000;
              9:s1=7'b0011000;
           endcase
        end
              6:begin
              s2=7'b0000010;
              s2=7'b1000000;
              end
           endcase
              out2=out2+1;
              end
              else out2=0;

        always@(posedge clk)
            if(counter==125000)
            begin
                counter<=0;
                new_clk<=1;
            end
            else
            begin
                counter<=counter+1;
                new_clk<=0;
            end


        always@(posedge new_clk)
            begin
            case(x)
            0:begin
                cathode=s1;
                anode=4'b1110;
            end
            1:begin
                cathode=s2;
                anode=4'b1101;
            end
            endcase
                x=x+1;
            end

endmodule
