// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.6.10;
pragma experimental ABIEncoderV2;
import "../DecimalMath.sol";


/// @dev Implements simple fixed point math mul and div operations for 27 decimals.
contract EchidnaDecimalMath is DecimalMath {

    constructor () public {}

    function echidna_always_true() public view returns(bool) {
        return true;
    }
}
