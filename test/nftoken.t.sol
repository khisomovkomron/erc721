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

        deploynftoken.run();
    }

    function testCorrectName() public view {
        console.logString("Kom");
        // console.log(nftoken.name);
        assertEq(keccak256(abi.encodePacked(nftoken.name)), (keccak256(abi.encodePacked("Kom"))));
    }
}
