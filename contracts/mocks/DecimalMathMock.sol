// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.6.10;
pragma experimental ABIEncoderV2;
import "../DecimalMath.sol";


/// @dev Implements simple fixed point math mul and div operations for 27 decimals.
contract DecimalMathMock is DecimalMath {
    constructor () public {}

    function muldc(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory uy = toUFixed(y);
        return muld(x, uy);
    }

    function muldu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        return muld(ux, uy).value;
    }

    function divdc(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory uy = toUFixed(y);
        return divd(x, uy);
    }

    function divdu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        return divd(ux, uy).value;
    }

    function divdi(uint256 x, uint256 y) public pure returns (uint256) {
        return divd(x, y).value;
    }

    function adddu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        return addd(ux, uy).value;
    }

    function subdu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        return subd(ux, uy).value;
    }

    function divdrupc(uint256 x, uint256 y) public pure returns (uint256)
    {
        UFixed memory uy = toUFixed(y);
        return divdrup(x, uy);
    }
}
