// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;


import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/erc721.sol";
import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract NFToken {
    // ERRORS

    // EVENTS

    // STATE VARIABLES
    mapping(address => uint256) private _balanceOf;


    constructor() {

    }

    function balanceOf(address owner) public view returns (uint256){
        return _balanceOf[owner];
    }

    function minting() public {}

    function transfer() public {}
}
