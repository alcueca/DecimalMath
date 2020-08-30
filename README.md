## Typed Decimal Math

This project is a strongly typed implementation for fixed point math in solidity.

When working with fixed point math, some numbers should be kept as integers, so this library implements cross-type functions for those cases.
Examples of fixed point numbers: Ratios (including exchange ratios), percentages, factors.
Examples of integers: Money (wei). Do we do math with anything else here?

This contract uses 27 decimals for fixed point numbers, following the standard from MakerDAO.

It uses the eternally experimental ABIEncoderV2, to allow passing structs as parameters.

Tested using echidna.
echidna-test . --contract DecimalMathEchidna --config contracts/mocks/DecimalMathEchidna.yaml

# Constants
UNIT: 1e27

# Structs
UFixed: A fixed point number.
UFixed.value: The raw value of the fixed point number. Note that 1.0 would be toUfixed(1e27).

# Functions

Except for `divd(uint, uint)` which returns an `UFixed`, all other functions return the type of the first parameter.

 - toUFixed(uint x) returns an UFixed created from x. 
 Note that 1.0 would be toUfixed(1e27). Note as well that to retrieve the integer part of an UFixed you can do UFixed.value.div(UNIT), and to get the mantissa you can do UFixed.value.mod(UNIT)
 - muld(uint x, UFixed y) returns uint(x * y).
 Use this to multiply a money amount by a ratio (wei amount * ETH/DAI)
 - muld(UFixed x, UFixed y) returns UFixed(x * y).
 Use this to multiply two ratios (DAI/ETH * ETH/MKR)
 - muld(UFixed x, uint y) returns UFixed(x * y).
 Use this to multiply two ratios by a factor (DAI/ETH * 2)
 - divd(UFixed x, UFixed y) returns UFixed(x / y).
 Use this to divide two ratios (DAI/ETH / ETH/MKR)
 - divd(uint x, UFixed y) returns uint(x / y). 
 Use this to divide a money amount by a ratio (wei amount / ETH/DAI)
  - divd(UFixed x, uint y) returns uint(x / y). 
 Use this to apply a divisor to a ratio (ETH/DAI / 2)
 - divd(uint x, uint y) returns UFixed(x / y).
 Use this to divide two integer amounts and derive a ratio (debt / supply)
 - addd(UFixed x, UFixed y) returns UFixed(x + y).
 Use this to add two ratios
 - addd(UFixed x, UFixed y) returns UFixed(x + y).
 Use this to add a factor two a ratio (debt ratio + 1)
 - subd(UFixed x, UFixed y) returns UFixed(x - y).
 Use this to substract two ratios
 - subd(UFixed x, uint y) returns UFixed(x - y).
 Use this to substract a factor from a ratio (debt ratio - 1)
 - subd(uint x, UFixed y) returns UFixed(x - y).
 Use this to substract a ratio from a factor (1 - debt ratio)
 - divdrup(uint x, UFixed y) returns uint(x / y), rounding up.
 Use this and divd to split a money amount into two parts that add up to the original value. x = divd(x, y) + divdrup(x, 1 - y).
 - muldrup(uint x, UFixed y) returns uint(x */* y), rounding up.
 Use this as the reverse of divd. z = divd(x, y), x = muldrup(z, y).
