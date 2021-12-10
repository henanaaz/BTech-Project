//image edge detection

module image_edge();

/////// edge matrix ///////

integer mcd;
  reg[7:0] mem [0:8099];
  reg [7:0] z_mem[0:8463];
  reg[7:0] new_mem [0:8099];
  reg[7:0] edge_m[8:0];
  reg [7:0]store;
  integer m,n;
    integer a,b,c,e,f,g;
    
    initial g=0;
    
  initial
    $readmemh("nitin.txt",mem);
    initial
        mcd = $fopen("file1.v");
      
      
    initial //zero padding
    begin
    for(c=0;c<8464;c=c+1)
    begin
   z_mem[c]=8'b0;
          for(e=0;e<91;e=e+1)
          begin
       m=e*92;
       for(f=93;f<183;f=f+1)
       begin
       z_mem[f+m]=mem[g];
       if(g<8099)
       g=g+1;
       else g=0;
         $fdisplay(mcd,z_mem[f+m]);
       end
     end
   end
          end

            
      initial
for(a=0;a<88;a=a+1)
begin
 n=a*90;
  for(b=0;b<88;b=b+1)
   begin 
  edge_m[0]=1*z_mem[b+n];
  edge_m[1]=2*z_mem[b+n+1];
  edge_m[2]=1*z_mem[b+n+2];
  edge_m[3]=0*z_mem[b+n+90];
  edge_m[4]=0*z_mem[b+n+91];
  edge_m[5]=0*z_mem[b+n+92];
  edge_m[6]=(-1'b1)*z_mem[b+n+180];
   edge_m[7]=(-2'b10)*z_mem[b+n+181];
   edge_m[8]=(-1'b1)*z_mem[b+n+182];
  new_mem[b+n]=edge_m[0]+edge_m[1]+edge_m[2]+edge_m[3]+edge_m[4]+edge_m[5]+edge_m[6]+edge_m[7]+edge_m[8];
   $fdisplay(mcd,new_mem[b+n]);
end
end


initial
$fclose(mcd);


endmodule
