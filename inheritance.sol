// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BaseContract {
    // Private function can only be called within the contract
    // Contracts that inherit from this contract cannot call the function

    function privateFunction() private pure returns (string memory) {
        return "PRIVATE FUNCTION CALLED";
    }

    //
    function testPrivateFunctionn() public pure returns (string memory) {
        return privateFunction();
    }

    // INTERNAL funtion can be called from inside the contract and
    // contracts that inherit from this contract

    function internalFunction() public pure virtual returns (string memory) {
        return "INTERNAL FUNCTION CALLED";
    }

    function testInternalFunction()
        public
        pure
        virtual
        returns (string memory)
    {
        return internalFunction();
    }

    // PULIC FUNCTIONS can be called inside this contract, inside conyracts that inherit
    // from this contract, and by other contracts and exxternal accounts

    function publicFunction() pure public returns (string memory) {
        return "PUBLIC FUNCTION CALLED";
    }

    // EXTERNAL FUNCTIONS can only be called by other contracts and external accounts

    function externalFunction() external pure returns (string memory) {
        return "EXTERNAL FUNCTION CALLED";
    }

    // The following function will not work because we are attempting to call
    // an external function
    // function textExternalFunction() public pure returns (string memory) {
    //     return externalFunction();
    // }

    // STATE VARIABLES

    string private privateVariabble = "My private variable";
    string internal internalVariable = "My internal variable";
    string public pubblicVariabble = "My public variable";
    // STATE variables cannot be EXTERNAL so this will not work...
    // string external externalVariable = "My external variable";
}

// Child Contract
// Inherited conntracts do not have access to private functions or state variables
contract Child is BaseContract {
    // function testPrivateFunction() public pure returns (string memory) {
    //     return internalFunction();
    // }

    // INTERNAL funnction call can be made from within a child contract
    function testInternalFunction()
        pure
        override
        public
        returns (string memory)
    {
        return internalFunction();
    }
}
