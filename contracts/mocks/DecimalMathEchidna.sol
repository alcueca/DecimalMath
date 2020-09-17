// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.6.10;
pragma experimental ABIEncoderV2;
import "../DecimalMath.sol";


/// @dev Implements simple fixed point math mul and div operations for 27 decimals.
contract DecimalMathEchidna {
    using DecimalMath for DecimalMath.UFixed;
    using DecimalMath for uint256;

    uint256 internal constant UNIT = 1e27;

    constructor () public {
        assert(UNIT == DecimalMath.UNIT);
    }

    function addd(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        DecimalMath.UFixed memory uz = ux.addd(uy);
        
        assert(uz.value >= x);
    }

    function subd(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        DecimalMath.UFixed memory uz = ux.subd(uy);
        
        assert(uz.value <= x);
    }

    function muld(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        DecimalMath.UFixed memory uz = ux.muld(uy);
        
        assert((x * y) / UNIT == uz.value);
        if(y > UNIT) assert(uz.value >= x); // x could be zero
        if(y < UNIT) assert(uz.value <= x); // y could be zero
    }

    function divd(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        uint z = x.divd(uy);

        assert((x * UNIT) / y == z);
        if(y > UNIT) assert(z <= x); // x could be zero
        if(y < UNIT) assert(z >= x); // x or y could be zero
    }

    function divdrup(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        uint z = x.divdrup(uy);

        assert (muldrup(z, y) >= x); // We are rounding up
        if (muld(z, y) > x) assert (divd(x, y) == z - 1); // Unless z * y is exactly x, we have rounded up.
        if(y > UNIT) assert(z <= x); // x could be zero
        if(y < UNIT) assert(z >= x); // x or y could be zero
    }

    function muldrup(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        uint z = x.muldrup(uy);
        
        assert (divdrup(z, y) >= x); // We are rounding up
        if (divd(z, y) > x) assert (muld(x, y) == z - 1);  // Unless z / y is exactly x, we have rounded up.
        if(y > UNIT) assert(z >= x); // x could be zero
        if(y < UNIT) assert(z <= x); // x or y could be zero
    }

    function powd_boundaries(uint256 x, uint256 n) public pure returns (uint256) {
        n = n % 161; // This is as far as we can test using `((x / UNIT) + 1) ** n)`
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uz = ux.powd(n);
        if(n == 0) assert(uz.value == UNIT);
        else {
            if(x > UNIT) { // If x = 2.5, we assert that x**2 is between 2**n and 3**n
                assert(uz.value / UNIT >= (x / UNIT) ** n);
                assert(uz.value / UNIT <= ((x / UNIT) + 1) ** n);
            } 
            if(x < UNIT) assert(uz.value <= x);
        }
    }

    function powd_monotone(uint256 x, uint256 n) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uz1 = ux.powd(n);
        ux.value += 1;
        DecimalMath.UFixed memory uz2 = ux.powd(n);
        assert(uz2.value >= uz1.value);
    }
}
