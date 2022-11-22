// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/Strings.sol";
contract Comment {
  mapping (address => uint256[]) public commentsRefKeys;

  function uploadCommentRefKey(uint256 commentRefKey) public {
    commentsRefKeys[msg.sender].push(commentRefKey);
  }

  function updateCommentRefKey(
    uint256 currentCommentRefKey, uint256 newCommentRefKey
  ) public {
    uint16 commentCount = 0;

    for (uint256 i = 0; i < commentsRefKeys[msg.sender].length; i++) {

      if (commentsRefKeys[msg.sender][i] == currentCommentRefKey) {
        commentsRefKeys[msg.sender][i] = newCommentRefKey;
      } else {
        commentCount++;
      }

      if (commentCount == commentsRefKeys[msg.sender].length) {
        revert(string.concat(
          "No comment by the provided reference key of: ",
           Strings.toString(currentCommentRefKey)
        ));
      }
    }
  }
}