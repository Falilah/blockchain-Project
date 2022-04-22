// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.6;

contract poll{
    struct Poll{
        enum Candidate{"yussuf", "hamed", "quduse"};
        uint numberOfVote;
        uint96 voteperiod;
    }
    mapping(uint => Poll) poll;
    mapping(address => msg.sender) voers;
    mapping(uint =>)
    uint pollID=1
    function createPoll(uint time, ) public {
        Poll storage p = Poll[pollID];
        p.voteperiod = time;
    }
    function vote(Candidate candidate) public{
        assert(!voters[msg.sender]);
        numberOfVote++


    }
}