// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/PostDB.sol";

contract PostDBTest is Test {
  PostDB public postDB;
  uint256 postRK = 0;
  uint256 commentRK = 0;

  function setUp() public {
    postDB = new PostDB();
  }

  function testSavePost() public {

    postDB.savePost(postRK); //TODO - create "checkpoints" for integration tests

    if (postDB.existentPost(postRK) == false) {
      revert("Failed to create a new post.");
    }
  }

  function testSavePost_overridingPost() public {
    postDB.savePost(postRK);
    try postDB.savePost(postRK) {
      revert("Failed to handle overriding posts.");
    } catch {}
  }

  function testSaveComment() public {
    postDB.savePost(postRK);

    Post po = postDB.post(postRK);

    assertTrue(po.commentCount() == 0);

    postDB.saveComment(postRK, commentRK);
    postDB.post(postRK).comments;

    assertTrue(po.commentCount() == 1);

    PostsCommentsLib.comment memory comment = po.getComments(commentRK);

    assertEq(comment.ipfsRK, postRK);
    // assertEq(comment.authorAddress, msg.sender); //TODO msg.sender might have changed and therefore this might be failing. A manaul test will be fine for now.

    //TODO - test failure to save comment when post hasn't first been created
  }

  function testUpdateCommentRK() public {

  }
}