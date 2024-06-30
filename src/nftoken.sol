// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;


import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/erc721.sol";
import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract NFToken{
    // ERRORS
    error InvalidReceiver(address to);
    error InvalidSender(address to);
    error InvalidOwner(address to);
    error NonexistingToken(uint256 tokenId);
    error IncorrectOwner(address from, uint256 tokeId, address previsousOwner);
    // EVENTS

    // STATE VARIABLES
    mapping(address => uint256) private _balanceOf;
    mapping(uint256 tokenId => address) private _owners;
    mapping(uint256 => string) private _tokenURIs;
    address private owner;

    string public _name; 
    string public _symbol; 

    // Functions Order:
    //// constructor
    //// receive
    //// fallback
    //// external
    //// public
    //// internal
    //// private
    //// view / pure

    constructor(string memory name_, string memory symbol_, address initialOwner) {
        _name = name_;
        _symbol = symbol_;
        owner = initialOwner;

    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function name() public view returns(string memory){ 
        return _name;
    }
    function symbol() public view returns(string memory) { 
        return _symbol;
    }

    function balanceOf(address _owner) public view returns (uint256){
        if (_owner == address(0)){
            revert InvalidOwner(address(0));
        }
        return _balanceOf[_owner];
    }



    function mint(address to, uint256 tokenId, string memory tokenUri) public onlyOwner returns (address){
        return _mint(to, tokenId, tokenUri);
    }

    function burn(uint256 tokenId) public onlyOwner{
        address previousOwner = _update(address(0), tokenId);
        if (previousOwner != address(0)) {
            revert NonexistingToken(tokenId);
        }
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

    // TODO
    // approve 
    // getApproved
    // setApprovalForAll
    // isApprovedForAll
    // safeTransferFrom

    function _mint(address to, uint256 tokenId, string memory tokenURI) private returns(address){
        if (to == address(0)){
            revert InvalidReceiver(address(0));
        }
        address previousOwner = _update(to, tokenId);
        if (previousOwner != address(0)){
            revert InvalidSender(address(0));
        }

        _setTokenUri(tokenId, tokenURI);
        return previousOwner;
    }

    function _update(address to, uint256 tokenId) public returns (address){ 
        address from = _owners[tokenId];

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

    function _safeMint(address to, uint256 tokenId, string memory tokenURI) private {
        _mint(to, tokenId, tokenURI);
        // should be implemented _checkOnERC721Received
    }

    function _tokenURI(uint256 tokenId) private view returns (string memory) {
        string memory _tokenUri = _tokenURIs[tokenId];
        string memory base = _baseURI();

        if (bytes(base).length == 0) {
            return _tokenUri;
        }

        if (bytes(_tokenUri).length == 0){
            return string.concat(base, _tokenUri);
        }

        return _tokenUri;

    }

    function _setTokenUri(uint256 tokenId, string memory _tokenUri) private {
        _tokenURIs[tokenId] = _tokenUri;
    } 

    function _baseURI() private pure returns (string memory) {
        return "";
    }

}
