/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module datapath5 (
    X,
    Y1,
    Y2,
    Y3,
    Y4,
    Y5
);

parameter DATAWIDTH = 8;

  // Port mode declarations:
  input  signed  [DATAWIDTH+1:0] X;
  output signed  [DATAWIDTH+10:0]
    Y1,
    Y2,
    Y3,
    Y4,
    Y5;

  wire signed [DATAWIDTH+10:0] Y [0:4];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];
  assign Y4 = Y[3];
  assign Y5 = Y[4];

  //Multipliers:

  wire signed [DATAWIDTH+10:0]
    w1,
    w4,
    w5,
    w16,
    w11,
    w1_,
    w5_,
    w10,
    w10_,
    w11_;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w5 = w1 + w4;
  assign w16 = w1 << 4;
  assign w11 = w16 - w5;
  assign w1_ = -1 * w1;
  assign w5_ = -1 * w5;
  assign w10 = w5 << 1;
  assign w10_ = -1 * w10;
  assign w11_ = -1 * w11;

  assign Y[0] = w1_;
  assign Y[1] = w4;
  assign Y[2] = w5_;
  assign Y[3] = w10_;
  assign Y[4] = w11_;

endmodule
