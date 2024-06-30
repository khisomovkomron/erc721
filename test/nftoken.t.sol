// SPDX-License-Identifier: LICENSED
pragma solidity ^0.8.20;

import {Test} from "lib/forge-std/src/Test.sol";
import {console} from "lib/forge-std/src/console.sol";
import {NFToken} from "../src/nftoken.sol";
import {DeployNFToken} from "../script/deploy_nftoken.s.sol";

contract NFTokenTest is Test {
    NFToken nftoken;
    address OWNER = address(0x123);
    address USER = address(0x456);
    string public TOKEN_URI = "https://example.com/token/1";
    uint256 public TOKEN_ID = 0;
    uint256 public TOKEN_ID2 = 1;

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
        string memory expectedSymbol = "KKK";
        string memory actualSymbol = nftoken.symbol();

        console.log("Expected Name:", expectedSymbol);
        console.log("Actual Name:", actualSymbol);
        assert(keccak256(abi.encodePacked(expectedSymbol)) == keccak256(abi.encodePacked(actualSymbol)));}

    function testMintNFT() public {
        nftoken.mint(USER, TOKEN_ID, TOKEN_URI);
        assertEq(nftoken.balanceOf(USER), 1);
    }

    function testMintToZeroAddress() public {
        vm.expectRevert();
        nftoken.mint(address(0), TOKEN_ID, TOKEN_URI);
    }

    function testMintWithInvalidSender() public {
        nftoken.mint(USER,TOKEN_ID , TOKEN_URI);
        vm.expectRevert();
        nftoken.mint(OWNER, TOKEN_ID, TOKEN_URI);
    }

    function testBurnNonexistentToken() public {
        nftoken.mint(USER, TOKEN_ID , TOKEN_URI);
        nftoken.mint(USER, TOKEN_ID2 , TOKEN_URI);
        vm.expectRevert();
        nftoken.burn(TOKEN_ID2);

    }

    function testBalanceOf() public {}

    function testBalanceOfInvalidOwner() public {}

    function testTransferFrom() public {}

    function testTransferFromToInvalidReceiver() public {}

    function testTransferFromInvalidOwner() public {}

    // tests TODO
    
    function testApprove() public {}

    function testgetApproved() public {}

    function testsetApprovalForAll() public {}

    function testisApprovedForAll() public {}

    function testsafeTransferFrom() public {}
    
}
