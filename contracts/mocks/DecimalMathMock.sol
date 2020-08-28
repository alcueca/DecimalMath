// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.6.10;
pragma experimental ABIEncoderV2;
import "../DecimalMath.sol";


/// @dev Implements simple fixed point math mul and div operations for 27 decimals.
contract DecimalMathMock is DecimalMath {
    constructor () public {}

    function muldc(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        return muld(ux, y).value;
    }

    function muldu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        return muld(ux, uy).value;
    }

    function divdc(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        return divd(ux, y).value;
    }

    function divdu(uint256 x, uint256 y) public pure returns (uint256) {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        return divd(ux, uy).value;
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
        UFixed memory ux = toUFixed(x);
        return divdrup(ux, y).value;
    }

    function divdrupu(uint256 x, uint256 y) public pure returns (uint256)
    {
        UFixed memory ux = toUFixed(x);
        UFixed memory uy = toUFixed(y);
        return divdrup(ux, uy).value;
    }
}
