// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract A {
    function greet() public pure virtual returns (string memory) {
        return "Hello from A";
    }
}

contract B {
    function greet() public pure virtual returns (string memory) {
        return "Hello from B";
    }
}

contract C is A, B {
    // Override to resolve the conflict between A and B
    function greet() public pure override(A, B) returns (string memory) {
        return string(abi.encodePacked(A.greet(), " and ", B.greet()));
    }
}