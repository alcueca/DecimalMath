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

    function adddu(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        DecimalMath.UFixed memory uz = ux.addd(uy);
        assert(uz.value >= x);
    }

    function subdu(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        DecimalMath.UFixed memory uz = ux.subd(uy);
        assert(uz.value <= x);
    }

    function muldc(uint256 x, uint256 y) public view returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        uint z = x.muld(uy);
        assert((x * y) / UNIT == z);
        if(y > UNIT) assert(z >= x); // x could be zero
        if(y < UNIT) assert(z <= x); // y could be zero
    }

    function muldu(uint256 x, uint256 y) public view returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        DecimalMath.UFixed memory uz = ux.muld(uy);
        assert((x * y) / UNIT == uz.value);
        if(y > UNIT) assert(uz.value >= x); // x could be zero
        if(y < UNIT) assert(uz.value <= x); // y could be zero
    }

    function divdc(uint256 x, uint256 y) public view returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        uint z = x.divd(uy);
        assert((x * UNIT) / y == z);
        if(y > UNIT) assert(z <= x); // x could be zero
        if(y < UNIT) assert(z >= x); // x or y could be zero
    }

    function divdu(uint256 x, uint256 y) public view returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        DecimalMath.UFixed memory uz = ux.divd(uy);
        assert((x * UNIT) / y == uz.value);
        if(y > UNIT) assert(uz.value <= x); // x could be zero
        if(y < UNIT) assert(uz.value >= x); // x could be zero
    }

    function divdi(uint256 x, uint256 y) public view returns (uint256) {
        DecimalMath.UFixed memory uz = x.divd(y);
        assert((x * UNIT) / y == uz.value);
        if(y > UNIT) assert(uz.value <= x); // x could be zero
        if(y < UNIT) assert(uz.value >= x); // x could be zero
    }

    function divdrupc(uint256 x, uint256 y) public view returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        uint z = x.divdrup(uy);
        if(((x * UNIT * 10) / y) % 10 == 0) assert((x * UNIT) / y == z);
        else assert((x * UNIT) / y == z - 1);
        if(y > UNIT) assert(z <= x); // x could be zero
        if(y < UNIT) assert(z >= x); // x or y could be zero
    }

    function muldrupc(uint256 x, uint256 y) public view returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        uint z = x.muldrup(uy);
        if(((x * y) / (UNIT / 10)) % 10 == 0) assert((x * y) / UNIT == z);
        else assert((x * y) / UNIT == z - 1);
        if(y > UNIT) assert(z >= x); // x could be zero
        if(y < UNIT) assert(z <= x); // x or y could be zero
    }
}
