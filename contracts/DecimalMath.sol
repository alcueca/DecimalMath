// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.6.10;
pragma experimental ABIEncoderV2;
import "@openzeppelin/contracts/math/SafeMath.sol";


/// @dev Implements simple fixed point math mul and div operations for 27 decimals.
contract DecimalMath {
    using SafeMath for uint256;

    uint256 constant public UNIT = 1000000000000000000000000000;

    struct UFixed {
        uint256 value;
    }

    /// @dev Creates a fixed point number from an unsigend integer. `toUFixed(1) = 10^-27`
    /// Converting from fixed point to integer
    function toUFixed(uint256 x) public pure returns (UFixed memory) {
        return UFixed({
            value: x
        });
    }

    /// @dev Multiplies x and y.
    /// @param x A fixed point number.
    /// @param y An unsigned integer.
    /// @return A fixed point number.
    function muld(UFixed memory x, uint256 y) public pure returns (UFixed memory) {
        return UFixed({
            value: x.value.mul(y).div(UNIT)
        });
    }

    /// @dev Multiplies x and y.
    /// @param x A fixed point number.
    /// @param y A fixed point number.
    /// @return A fixed point number.
    function muld(UFixed memory x, UFixed memory y) public pure returns (UFixed memory) {
        return muld(x, y.value);
    }

    /// @dev Divides x by y.
    /// @param x A fixed point number.
    /// @param y An unsigned integer.
    /// @return A fixed point number.
    function divd(UFixed memory x, uint256 y) public pure returns (UFixed memory) {
        return UFixed({
            value: x.value.mul(UNIT).div(y)
        });
    }

    /// @dev Divides x by y.
    /// @param x A fixed point number.
    /// @param y A fixed point number.
    /// @return A fixed point number.
    function divd(UFixed memory x, UFixed memory y) public pure returns (UFixed memory) {
        return divd(x, y.value);
    }

    /// @dev Adds x and y.
    /// @param x A fixed point number.
    /// @param y A fixed point number.
    /// @return A fixed point number.
    function addd(UFixed memory x, UFixed memory y) public pure returns (UFixed memory) {
        return UFixed({
            value: x.value.add(y.value)
        });
    }

    /// @dev Subtracts x and y.
    /// @param x A fixed point number.
    /// @param y A fixed point number.
    /// @return A fixed point number.
    function subd(UFixed memory x, UFixed memory y) public pure returns (UFixed memory) {
        return UFixed({
            value: x.value.sub(y.value)
        });
    }

    /// @dev Divides x between y, rounding up to the closest representable number.
    /// @param x A fixed point number.
    /// @param y An unsigned integer.
    /// @return A fixed point number.
    function divdrup(UFixed memory x, uint256 y) public pure returns (UFixed memory)
    {
        uint256 z = x.value.mul(10000000000000000000000000000).div(y); // RAY * 10
        if (z % 10 > 0) return UFixed({ value: z / 10 + 1 });
        else return UFixed({ value: z / 10 });
    }

    /// @dev Divides x between y, rounding up to the closest representable number.
    /// @param x A fixed point number.
    /// @param y A fixed point number.
    /// @return A fixed point number.
    function divdrup(UFixed memory x, UFixed memory y) public pure returns (UFixed memory)
    {
        return divdrup(x, y.value);
    }
}
