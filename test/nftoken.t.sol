// SPDX-License-Identifier: LICENSED
pragma solidity ^0.8.20;

import {Test} from "lib/forge-std/src/Test.sol";
import {console} from "lib/forge-std/src/console.sol";
import {NFToken} from "../src/nftoken.sol";
import {DeployNFToken} from "../script/deploy_nftoken.s.sol";

contract NFTokenTest is Test {
    NFToken nftoken;

    function setUp() public {
        DeployNFToken deploynftoken = new DeployNFToken();

        nftoken = deploynftoken.run();
    }

    function testCorrectName() public view {
        string memory expectedName = "Kom";
        string memory actualName = nftoken.name();

        console.log("Expected Name:", expectedName);
        console.log("Actual Name:", actualName);

        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));}

    function testCorrectSymbol() public view {
        string memory actualSymbol = nftoken.symbol();


        assert(keccak256(abi.encodePacked("KKK")) == keccak256(abi.encodePacked(actualSymbol)));}

    
}
