// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.6.10;
pragma experimental ABIEncoderV2;
import "../DecimalMath.sol";


/// @dev Implements simple fixed point math mul and div operations for 27 decimals.
contract DecimalMathEchidna is DecimalMath {
    constructor () public {}

    function adddu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        UFixed memory uz = addd(ux, uy);
        assert(uz.value >= x);
    }

    function subdu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        UFixed memory uz = subd(ux, uy);
        assert(uz.value <= x);
    }

    function muldc(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory uy = toUFixed(y);
        uint z = muld(x, uy);
        assert((x * y) / UNIT == z);
        if(y > UNIT) assert(z >= x); // x could be zero
        if(y < UNIT) assert(z <= x); // y could be zero
    }

    function muldu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        UFixed memory uz = muld(ux, uy);
        assert((x * y) / UNIT == uz.value);
        if(y > UNIT) assert(uz.value >= x); // x could be zero
        if(y < UNIT) assert(uz.value <= x); // y could be zero
    }

    function divdc(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory uy = toUFixed(y);
        uint z = divd(x, uy);
        assert((x * UNIT) / y == z);
        if(y > UNIT) assert(z <= x); // x could be zero
        if(y < UNIT) assert(z >= x); // x or y could be zero
    }

    function divdu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        UFixed memory uz = divd(ux, uy);
        assert((x * UNIT) / y == uz.value);
        if(y > UNIT) assert(uz.value <= x); // x could be zero
        if(y < UNIT) assert(uz.value >= x); // x could be zero
    }

    function divdi(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory uz = divd(x, y);
        assert((x * UNIT) / y == uz.value);
        if(y > UNIT) assert(uz.value <= x); // x could be zero
        if(y < UNIT) assert(uz.value >= x); // x could be zero
    }

    function divdrupc(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory uy = toUFixed(y);
        uint z = divdrup(x, uy);
        if(((x * UNIT * 10) / y) % 10 == 0) assert((x * UNIT) / y == z);
        else assert((x * UNIT) / y == z - 1);
        if(y > UNIT) assert(z <= x); // x could be zero
        if(y < UNIT) assert(z >= x); // x or y could be zero
    }
}
