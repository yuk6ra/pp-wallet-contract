// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "../samples/SimpleAccount.sol";

interface ITwilightAccountFactory {

    function createAccount(
        address owner,
        string memory username
    ) external returns (SimpleAccount);

    function getAddress(
        address owner, 
        string memory username
    ) external view returns (address);

}
