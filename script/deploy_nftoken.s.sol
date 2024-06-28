// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script} from "lib/forge-std/src/Script.sol";
import {NFToken} from "../src/nftoken.sol";

contract DeployNFToken is Script {
        
    function run() external returns(NFToken) {
        vm.startBroadcast();
        NFToken nftoken = new NFToken("Kom", "KKK", msg.sender);

        vm.stopBroadcast();
        return nftoken;
    }
}
