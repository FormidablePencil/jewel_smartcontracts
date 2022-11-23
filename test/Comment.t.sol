// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Comment.sol";

contract CommentTest is Test {
  Comment public comment;

  function testUploadCommentOfPost() public {
    comment.uploadCommentRefKey(0);
  }

  function testUpdateCommentOfPost() public {
    uint16 commentRefKey = 0;
    comment.uploadCommentRefKey(commentRefKey);
    comment.updateCommentRefKey(commentRefKey, 1);
  }

  function testFailUpdateCommentOfPost_noCommentFoundByGivenRefKey() public {
    comment.updateCommentRefKey(0, 1);
  }
}