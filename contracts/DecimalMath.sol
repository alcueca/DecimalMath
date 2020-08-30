// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.6.10;
pragma experimental ABIEncoderV2;
import "./SafeMath.sol";


/// @dev Implements simple fixed point math mul and div operations for 27 decimals.
library DecimalMath {
    using SafeMath for uint256;

    uint256 constant internal UNIT = 1e27;

    struct UFixed {
        uint256 value;
    }

    /// @dev Creates a fixed point number from an unsiged integer. `toUFixed(1) = 10^-27`
    /// Converting from fixed point to integer can be done with `UFixed.value / UNIT` and `UFixed.value % UNIT`
    function toUFixed(uint256 x) internal pure returns (UFixed memory) {
        return UFixed({
            value: x
        });
    }

    /// @dev Multiplies x and y.
    /// @param x An unsigned integer.
    /// @param y A fixed point number.
    /// @return An unsigned integer.
    function muld(uint256 x, UFixed memory y) internal pure returns (uint256) {
        return x.mul(y.value).div(UNIT);
    }

    /// @dev Multiplies x and y.
    /// @param x A fixed point number.
    /// @param y A fixed point number.
    /// @return A fixed point number.
    function muld(UFixed memory x, UFixed memory y) internal pure returns (UFixed memory) {
        return UFixed({
            value: muld(x.value, y)
        });
    }

    /// @dev Divides x by y.
    /// @param x An unsigned integer.
    /// @param y A fixed point number.
    /// @return An unsigned integer.
    function divd(uint256 x, UFixed memory y) internal pure returns (uint256) {
        return x.mul(UNIT).div(y.value);
    }

    /// @dev Divides x by y.
    /// @param x A fixed point number.
    /// @param y A fixed point number.
    /// @return A fixed point number.
    function divd(UFixed memory x, UFixed memory y) internal pure returns (UFixed memory) {
        return UFixed({
            value: divd(x.value, y)
        });
    }

    /// @dev Divides x by y.
    /// @param x An unsigned integer.
    /// @param y An unsigned integer.
    /// @return A fixed point number.
    function divd(uint256 x, uint256 y) internal pure returns (UFixed memory) {
        return UFixed({
            value: x.mul(UNIT).div(y)
        });
    }

    /// @dev Adds x and y.
    /// @param x A fixed point number.
    /// @param y A fixed point number.
    /// @return A fixed point number.
    function addd(UFixed memory x, UFixed memory y) internal pure returns (UFixed memory) {
        return UFixed({
            value: x.value.add(y.value)
        });
    }

    /// @dev Subtracts x and y.
    /// @param x A fixed point number.
    /// @param y A fixed point number.
    /// @return A fixed point number.
    function subd(UFixed memory x, UFixed memory y) internal pure returns (UFixed memory) {
        return UFixed({
            value: x.value.sub(y.value)
        });
    }

    /// @dev Divides x between y, rounding up to the closest representable number.
    /// @param x An unsigned integer.
    /// @param y A fixed point number.
    /// @return An unsigned integer.
    function divdrup(uint256 x, UFixed memory y) internal pure returns (uint256)
    {
        uint256 z = x.mul(1e28).div(y.value); // UNIT * 10
        if (z % 10 > 0) return z / 10 + 1;
        else return z / 10;
    }

    /// @dev Multiplies x by y, rounding up to the closest representable number.
    /// @param x An unsigned integer.
    /// @param y A fixed point number.
    /// @return An unsigned integer.
    function muldrup(uint256 x, UFixed memory y) internal pure returns (uint256)
    {
        uint256 z = x.mul(y.value).div(1e26); // UNIT / 10
        if (z % 10 > 0) return z / 10 + 1;
        else return z / 10;
    }
}
