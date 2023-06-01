// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

interface ITwilightAccountFactory {

    function createAccount(
        address owner,
        string memory username
    ) external returns (address);

    function getAddress(
        address owner, 
        string memory username
    ) external view returns (address);

}
