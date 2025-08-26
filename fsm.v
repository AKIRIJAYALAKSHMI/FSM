module sd1001_mealy(
    input clk,
    input reset,
    input din,
    output reg dout
);

  // State encoding
  parameter S0 = 3'b00;
  parameter S1 = 3'b01;
  parameter S2 = 3'b10;
  parameter S3 = 3'b11;
 

  reg [1:0] state;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      dout <= 1'b0;
      state <= S0;
    end
    else begin
      case (state)
        S0: begin
          if (din)
	  begin
            state <= S1;
	     dout <= 1'b0;
     end

    else
    begin
	    state<= S0;
	     dout <= 1'b0;
     end

        end
        S1: begin
          if (~din)
	  begin
            state <= S2;
     dout <= 1'b0;
     end

    else
    begin
	    state <= S1;
	     dout <= 1'b0;

        end
end
        S2: begin
         
          if (~din)
	  begin
            state <= S3;
     dout <= 1'b0;
end
          else
	  begin
            state <= S1;
	     dout <= 1'b0;
     end
        end
       /*
       //nonoverlapping mealy
       S3: begin
         
          if (din)
	  begin
            state <= S1;
	     dout <= 1'b1;
     end
          else
	  begin
            state <= S0;
	     dout <= 1'b0;

        end
end*/
       
 //overlapping mealy
       S3: begin
         
          if (din)
	  begin
            state <= S0;
	     dout <= 1'b1;
     end
          else
	  begin
            state <= S0;
	     dout <= 1'b0;

        end
end

        default: begin
          dout <= 1'b0;
          state <= S0;
        end
      endcase
    end
  end

endmodule
