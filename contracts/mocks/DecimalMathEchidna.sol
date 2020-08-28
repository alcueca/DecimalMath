// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.6.10;
pragma experimental ABIEncoderV2;
import "../DecimalMath.sol";
import "@nomiclabs/buidler/console.sol";


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
        UFixed memory ux = toUFixed(x);
        UFixed memory uz = muld(ux, y);
        assert((ux.value * y) / UNIT == uz.value);
        if(y > UNIT) assert(uz.value >= ux.value); // x could be zero
        if(y < UNIT) assert(uz.value <= ux.value); // y could be zero
    }

    function muldu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        UFixed memory uz = muld(ux, uy);
        assert((ux.value * uy.value) / UNIT == uz.value);
        if(uy.value > UNIT) assert(uz.value >= ux.value); // x could be zero
        if(uy.value < UNIT) assert(uz.value <= ux.value); // x or y could be zero
    }

    function divdc(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uz = divd(ux, y);
        assert((ux.value * UNIT) / y == uz.value);
        if(y > UNIT) assert(uz.value <= ux.value); // x could be zero
        if(y < UNIT) assert(uz.value >= ux.value); // x or y could be zero
    }

    function divdu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        UFixed memory uz = divd(ux, uy);
        assert((ux.value * UNIT) / uy.value == uz.value);
        if(uy.value > UNIT) assert(uz.value <= ux.value); // x could be zero
        if(uy.value < UNIT) assert(uz.value >= ux.value); // x could be zero
    }

    function divdrupc(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uz = divdrup(ux, y);
        if(((ux.value * UNIT * 10) / y) % 10 == 0) assert((ux.value * UNIT) / y == uz.value);
        else assert((ux.value * UNIT) / y == uz.value - 1);
        if(y > UNIT) assert(uz.value <= ux.value); // x could be zero
        if(y < UNIT) assert(uz.value >= ux.value); // x or y could be zero
    }

    function divdrupu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        UFixed memory uz = divdrup(ux, uy);
        assert(((ux.value * UNIT) / y == uz.value) || ((ux.value * UNIT) / y == uz.value - 1));
        if(uy.value > UNIT) assert(uz.value <= ux.value); // x could be zero
        if(uy.value < UNIT) assert(uz.value >= ux.value); // x could be zero
    }
}
