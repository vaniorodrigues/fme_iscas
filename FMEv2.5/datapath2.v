/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module datapath2 (
    X,
    Y1,
    Y2
);

parameter DATAWIDTH = 8;

  // Port mode declarations:
  input  signed  [DATAWIDTH+1:0] X;
  output signed  [DATAWIDTH+10:0]
    Y1, 
    Y2;

  wire signed [DATAWIDTH+10:0] Y [0:1];
  assign Y1 = Y[0];
  assign Y2 = Y[1];

  //Multipliers:

  wire signed [DATAWIDTH+10:0]
    w1,
    w1_,
    w4;

  assign w1 = X;
  assign w1_ = -1 * w1;
  assign w4 = w1 << 2;

  assign Y[0] = w1_;
  assign Y[1] = w4;

endmodule 
