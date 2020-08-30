// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.6.10;
pragma experimental ABIEncoderV2;
import "../DecimalMath.sol";


/// @dev Implements simple fixed point math mul and div operations for 27 decimals.
contract DecimalMathMock {
    using DecimalMath for DecimalMath.UFixed;
    using DecimalMath for uint256;

    function muldc(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        return x.muld(uy);
    }

    function muldu(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.muld(uy).value;
    }

    function divdc(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        return x.divd(uy);
    }

    function divdu(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.divd(uy).value;
    }

    function divdi(uint256 x, uint256 y) public pure returns (uint256) {
        return x.divd(y).value;
    }

    function adddu(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.addd(uy).value;
    }

    function subdu(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.subd(uy).value;
    }

    function divdrupc(uint256 x, uint256 y) public pure returns (uint256)
    {
        DecimalMath.UFixed memory uy = y.toUFixed();
        return x.divdrup(uy);
    }
}
