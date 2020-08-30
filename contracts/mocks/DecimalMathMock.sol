// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.6.10;
pragma experimental ABIEncoderV2;
import "../DecimalMath.sol";


/// @dev Implements simple fixed point math mul and div operations for 27 decimals.
contract DecimalMathMock {
    using DecimalMath for DecimalMath.UFixed;
    using DecimalMath for uint256;

    function eq(uint256 x, uint256 y) public pure returns (bool) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.eq(uy);
    }

    function gt(uint256 x, uint256 y) public pure returns (bool) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.gt(uy);
    }

    function geq(uint256 x, uint256 y) public pure returns (bool) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.geq(uy);
    }

    function lt(uint256 x, uint256 y) public pure returns (bool) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.lt(uy);
    }

    function leq(uint256 x, uint256 y) public pure returns (bool) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.leq(uy);
    }

    function muld1(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        return x.muld(uy);
    }

    function muld2(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.muld(uy).value;
    }

    function muld3(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        return ux.muld(y).value;
    }

    function divd1(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        return x.divd(uy);
    }

    function divd2(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.divd(uy).value;
    }

    function divd3(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        return ux.divd(y).value;
    }

    function divd4(uint256 x, uint256 y) public pure returns (uint256) {
        return x.divd(y).value;
    }

    function addd1(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.addd(uy).value;
    }

    function addd2(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        return ux.addd(y).value;
    }

    function subd1(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        DecimalMath.UFixed memory uy = y.toUFixed();
        return ux.subd(uy).value;
    }

    function subd2(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        return ux.subd(y).value;
    }

    function subd3(uint256 x, uint256 y) public pure returns (uint256) {
        DecimalMath.UFixed memory uy = y.toUFixed();
        return x.subd(uy).value;
    }

    function divdrup(uint256 x, uint256 y) public pure returns (uint256)
    {
        DecimalMath.UFixed memory uy = y.toUFixed();
        return x.divdrup(uy);
    }

    function muldrup(uint256 x, uint256 y) public pure returns (uint256)
    {
        DecimalMath.UFixed memory uy = y.toUFixed();
        return x.muldrup(uy);
    }

    function powd(uint256 x, uint256 n) public pure returns (uint256) {
        DecimalMath.UFixed memory ux = x.toUFixed();
        return ux.powd(n).value;
    }
}
