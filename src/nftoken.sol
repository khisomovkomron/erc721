// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;


import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/erc721.sol";
import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract NFToken {
    // ERRORS

    // EVENTS

    // STATE VARIABLES
    mapping(address => uint256) private _balanceOf;
    mapping(uint256 tokenId => address) private _owners;

    string public _name; 
    string public _symbol; 

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;

    }

    function name() public view returns(string memory){ 
        return _name;
    }
    function symbol() public view returns(string memory) { 
        return _symbol;
    }

    function balanceOf(address owner) public view returns (uint256){
        return _balanceOf[owner];
    }

    function minting(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }

    function burn(uint256 tokenId) public {
        _update(address(0), tokenId);
    }

    function transfer() public {}

    function _update(address to, uint256 tokenId) public returns (address){ 
        address from = _owners[tokenId];

        // should check if from exists

        // should add reverts for if conditions

        if (from != address(0)) {
            unchecked {
                _balanceOf[from] -= 1;
            }
        }

        if (to != address(0)) {
            unchecked {
                _balanceOf[to] += 1;
            }
        }

        _owners[tokenId] = to;

        return from;

    }


    function _mint(address to, uint256 tokenId) private {
        _update(to, tokenId);
        //check if address exist from previuous line
    }

    function _safeMint(address to, uint256 tokenId) private {
        _mint(to, tokenId);
        // should be implemented _checkOnERC721Received
    }

}
