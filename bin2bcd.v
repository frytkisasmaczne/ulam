module bin2bcd
 #( parameter                W = 8 )
  ( input      [W-1      :0] bin   ,  // binary
    output reg [W+(W-4)/3:0] bcd   ); // bcd {...,thousands,hundreds,tens,ones}

  integer i,j;

  always @(bin) begin
    bcd = 0;     // initialize with zeros
    bcd[W-1:0] = bin;                                   // initialize with input vector
    for(i = 0; i <= W-4; i = i+1)                       // iterate on structure depth
      for(j = 0; j <= i/3; j = j+1)                     // iterate on structure width
        if (bcd[W-i+4*j -: 4] > 4)                      // if > 4
          bcd[W-i+4*j -: 4] = bcd[W-i+4*j -: 4] + 4'd3; // add 3
  end

endmodule
//i have a stronk feeling this module is fucked up
//that's some canadian professor gaming for you
