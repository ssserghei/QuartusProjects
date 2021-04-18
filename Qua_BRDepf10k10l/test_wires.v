module test_wires(
     input wire key0,
     input wire key1,
     input wire key2,
     input wire key3,
     output wire led0,
     output wire led1
     );

assign led0 = key0 & key1;
assign led1 = key2 | key3;

endmodule