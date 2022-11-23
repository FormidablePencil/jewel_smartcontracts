// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/PostDB.sol";

contract PostDBTest is Test {
  PostDB public postDB;

  function setUp() public {
    postDB = new PostDB();
  }

  function testCreatePost() public {
    uint256 postRefKey = 0;
    console.log(postRefKey); //TODO - make console logging work

    postDB.createPost(postRefKey);

    Post post = postDB.post(postRefKey);
    bool postExists = postDB.existentPost(postRefKey);
    if (postDB.existentPost(postRefKey) == false) {
      revert("Failed to create a new post.");
    }
  }

  function testCreatePost_overridingPost() public {
    uint256 postRefKey = 0;

    postDB.createPost(postRefKey);
    try postDB.createPost(postRefKey) {
      revert("Failed to handle overriding posts.");
    } catch {}
  }

  function testUploadCommentRefKey(uint256 postRefKey, uint256 commentRefKey) public {
    // todo - create a post first of all

    // require(postDB.post[postRefKey]);

    postDB.uploadRefKeyComment(postRefKey, commentRefKey);
    // Post.addComment(postRefKey, commentRefKey);
  }

  function testUpdateCommentOfPost() public {

  }
}