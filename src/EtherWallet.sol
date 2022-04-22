// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.6;

contract EtherWallet {

    address owner;
    mapping (address => uint) public etherwallet;
    uint public contractBalance;
    constructor(){
        owner = msg.sender;
    }
    modifier  onlyOwner(){

        require(owner == msg.sender, "only owner");
        _;

    }
    function sendEthers(address to) external payable {
        assert(msg.sender != address(0) && to != address(0));
        (bool success,) = (to).call{value: msg.value}("");
        etherwallet[to] += msg.value; 
        contractBalance += msg.value ; 

        }

    function withrawEthers(address payable to) external payable {
        require(msg.value >= etherwallet[msg.sender], "insufficiet coin");
        etherwallet[to] -= msg.value;         
        (bool success,) = (to).call{value: msg.value}("");

    }
    
    function checkbalance() public view returns(uint contractbal){
        contractbal = address(this).balance;
    }
     function transferOut() public onlyOwner{
        payable(owner).transfer(address(this).balance);
        }
    receive() external payable  {}

}
