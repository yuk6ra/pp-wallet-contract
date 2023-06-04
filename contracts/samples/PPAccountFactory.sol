// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18;

// import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Create2.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

import "./SimpleAccount.sol";
import "../interfaces/IPPAccountFactory.sol";
import "../utils/String.sol";

contract PPAccountFactory is IPPAccountFactory {

    using String for string;

    SimpleAccount public immutable accountImplementation;

    // bytes32[] allowlist;

    constructor(IEntryPoint _entryPoint) {
        accountImplementation = new SimpleAccount(_entryPoint);
    }

    /**
     * create an account, and return its address.
     * returns the address even if the account is already deployed.
     * Note that during UserOperation execution, this method is called only if the account is not deployed.
     * This method returns an existing account address so that entryPoint.getSenderAddress() would work even after account creation
     */
    function createAccount(address owner, string calldata username, string calldata platform) public returns (SimpleAccount ret) {
        address addr = getAddress(owner, username, platform);
        uint codeSize = addr.code.length;
        if (codeSize > 0) {
            return SimpleAccount(payable(addr));
        }
        ret = SimpleAccount(payable(new ERC1967Proxy{salt : _generateSalt(username, platform)}(
                address(accountImplementation),
                abi.encodeCall(SimpleAccount.initialize, (owner))
            )));
    }

    /**
     * calculate the counterfactual address of this account as it would be returned by createAccount()
     */
    function getAddress(address owner, string calldata username, string calldata platform) public view returns (address) {
        return Create2.computeAddress(_generateSalt(username, platform), keccak256(abi.encodePacked(
                type(ERC1967Proxy).creationCode,
                abi.encode(
                    address(accountImplementation),
                    abi.encodeCall(SimpleAccount.initialize, (owner))
                )
            )));
    }

    function _generateSalt(string calldata username, string calldata platform) private pure returns (bytes32) {
        bytes memory usernameBytes = bytes(username.toLowerCase());
        bytes memory platformBytes = bytes(platform.toLowerCase());
        return keccak256(abi.encodePacked(usernameBytes, platformBytes));
    }
}
