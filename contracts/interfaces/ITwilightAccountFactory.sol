// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "../samples/SimpleAccount.sol";

interface ITwilightAccountFactory {

    function createAccount(
        address owner,
        string calldata username,
        string calldata platform
    ) external returns (SimpleAccount);

    function getAddress(
        address owner, 
        string calldata username,
        string calldata platform
    ) external view returns (address);

}
