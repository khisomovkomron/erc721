// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;


import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/erc721.sol";
import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract NFToken is Ownable{
    // ERRORS
    error InvalidReceiver(address to);
    error IncorrectOwner(address from, address tokeId, address previsousOwner);
    // EVENTS

    // STATE VARIABLES
    mapping(address => uint256) private _balanceOf;
    mapping(uint256 tokenId => address) private _owners;
    mapping(uint256 => string) private _tokenURIs;

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

    function mint(address to, uint256 tokenId) public onlyOwner{
        _mint(to, tokenId);
    }

    function burn(uint256 tokenId) public onlyOwner{
        _update(address(0), tokenId);
    }

    function transferFrom(address from, address to, uint256 tokenId) public onlyOwner{
        if (to == address(0)) {
            revert InvalidReceiver(address(0));
        }
        address previousOwner= _update(to, tokenId);
        if (previousOwner != from) {
            revert IncorrectOwner(from, tokenId, previousOwner);
        }
    }

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


    function _mint(address to, uint256 tokenId, tokenURI) private {
        _update(to, tokenId);
        _setTokenUri(tokenId, tokenURI);

        //check if address exist from previuous line
    }

    function _safeMint(address to, uint256 tokenId) private {
        _mint(to, tokenId);
        // should be implemented _checkOnERC721Received
    }

    function _tokenURI(uint256 tokenId) private returns (string memory) {
        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = _baseURI();

        if (bytes(base).length == 0) {
            return _tokenURI;
        }

        if (bytes(_tokenURI).length == 0){
            return string.concat(base, _tokenURI);
        }

    }

    function _setTokenUri(uint256 tokenId, string memory _tokenURI) private {
        _tokenURIs[tokenId] = _tokenURI;
    } 

    function _baseURI() private returns (string memory) {
        return "";
    }

}
