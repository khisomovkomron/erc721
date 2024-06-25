// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {NFToken} from "../src/nftoken.sol";

contract NFTokenTest is Test {

    
    function run() external returns(NFToken) {
        vm.startBroadcast();
        NFToken nftoken = new NFToken("Kom", "KKK");

        vm.stopBroadcast();
        return nftoken;
    }
}
