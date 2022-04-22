// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.6;
 contract multiSend{
     address public owner;
     constructor(){
        owner = msg.sender;
     }
     modifier onlyOwner(){
        require(owner == msg.sender, "only owner");
         
          _;
     }
     function sendEther(address[] memory employees, uint amount) public payable{
        uint TotalAmount = amount * employees.length;
            require(msg.value == TotalAmount, "money sent is not in proportion");
         for(uint i; i < employees.length; i++){
        require(employees[i] != address(0), "call failed money sent address(0) will be lost");
        (bool success,) = (payable(employees[i])).call{value: amount}("");
    }
     }
         function transferOut() public onlyOwner{
            payable(owner).transfer(address(this).balance);
    }
       
    receive() external payable  {}
 }
 // "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2","0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db", "0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB"