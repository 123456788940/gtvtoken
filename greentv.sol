// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract gtvToken is ERC20 {
    constructor() ERC20("Greentv Token", "GTV") {
        _mint(msg.sender, 300 * 10 ** 6); // Set initial supply to 300 million tokens with 8 decimals
    }

    function _transfer(address to, uint256 numOfTokens) public returns (bool) {
        require(numOfTokens > 0, "Number of tokens must be greater than 0");
        require(numOfTokens <= balanceOf(msg.sender), "Insufficient balance");
         _mint(to, numOfTokens);
        _transfer(msg.sender, to, numOfTokens);
        return true;
    }
}

