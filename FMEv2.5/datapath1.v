/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module datapath1 (
    X,
    Y
);


parameter DATAWIDTH = 8;

  // Port mode declarations:
  input  signed  [DATAWIDTH+1:0] X;
  output signed  [DATAWIDTH+10:0] Y;
  
  //Multipliers:

  wire signed [DATAWIDTH+10:0]
    w1,
    w1_;

  assign w1 = X;
  assign w1_ = -1 * w1;

  assign Y = w1_;

endmodule 