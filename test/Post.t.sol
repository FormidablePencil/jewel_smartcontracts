// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Post.sol";

contract PostTest is Test {
  Post public post;

  function testUploadCommentOfPost() {
    Post.addComment(postRefKey, commentRefKey);
  }

  function testUpdateCommentOfPost() {

  }
}