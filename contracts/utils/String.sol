// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

library String {
    function toLowerCase(string memory _str) internal pure returns (string memory) {
        bytes memory strBytes = bytes(_str);
        for (uint i = 0; i < strBytes.length; i++) {
            if ((uint8(strBytes[i]) >= uint8(bytes1("A"))) && (uint8(strBytes[i]) <= uint8(bytes1("Z")))) {
                strBytes[i] = bytes1(uint8(strBytes[i]) + 32);
            }
        }
        return string(strBytes);
    }
}