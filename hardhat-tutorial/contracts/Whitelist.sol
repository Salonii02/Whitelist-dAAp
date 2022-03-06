//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
contract Whitelist {
   uint8 public maxWhitelistedAddresses;
   mapping(address => bool) public whitelistedAddresses;
   uint8 public numWhitelistedAddresses; 

   constructor(uint8 _maxWhitelistedAddresses){
       maxWhitelistedAddresses=_maxWhitelistedAddresses;
   }
   function addWhitelistAddress() public {
       require(!whitelistedAddresses[msg.sender], "This address is already whitelisted");
       require(numWhitelistedAddresses<maxWhitelistedAddresses,"Max whiteaddress number is reached");
       whitelistedAddresses[msg.sender]=true;
       numWhitelistedAddresses=numWhitelistedAddresses+1;
   }
}
