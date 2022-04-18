// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0; 
contract Voting {
 /* mapping is equivalent to an associate array or hash
 The key of the mapping is candidate name stored as type bytes32 and value is
 an unsigned integer which used to store the vote count
 */
 mapping (bytes32 => uint8) public votesReceived;

 bytes32[] public candidateList;
 // Initialize all the contestants
 function Vote(bytes32[]  memory candidateNames) public {
 candidateList = candidateNames;
 }
    function totalVotesFor(bytes32 candidate) view public returns (uint8) {
    require(validCandidate(candidate));
 return votesReceived[candidate];
 }

 function voteForCandidate(bytes32 candidate) public  {
 require(validCandidate(candidate));
 votesReceived[candidate] += 1;
 }
 function validCandidate(bytes32 candidate) view public returns(bool) {
 for(uint i = 0; i < candidateList.length; i++) {
 if (candidateList[i] == candidate) {
 return true;
 }
 }
 return false;
 }
 // This function returns the list of candidates.
 function getCandidateList ()view  public returns (  bytes32[] memory){
     return  candidateList;
 }
}
