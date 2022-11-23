// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

  /**
   * @title PostDB
   * @dev Handles posts related functionality
   * @custom:dev-run-script file_path
   */
contract PostDB {
  mapping (uint256 => Post) public post;
  mapping (uint256 => bool) public existentPost;

  /// @notice Saves the ipfs reference key.
  /// @dev Save post. If a post exists under postPK then don't override it and revert.
  /// @param postRK Post's reference key.
  //TODO 
  function savePost(uint256 postRK) public {
    if (existentPost[postRK] == true) {
      revert(string.concat(
        "A post under reference key of ",
        Strings.toString(postRK),
        " exists."
      ));
    } else {
      post[postRK] = new Post();
      existentPost[postRK] = true;
    }
  }

  /*
    @notice Save the ifps reference key under a specified post and assign to author address for modification privilege purposes.
    @param postRK Post's reference key.
    @param commentRK Comment's reference key.
  */
  function saveComment(uint256 postRK, uint256 commentRK) public {
    post[postRK].saveComment(PostsCommentsLib.comment({ipfsRK: commentRK, authorAddress: msg.sender}));
  }

  function getCommentsOfPost()public view returns (uint) {
    
  }
}

library PostsCommentsLib {
  struct comment {
    uint256 ipfsRK; //TODO - test to see that both values are inserted
    address authorAddress;
  }
}

contract Post {
  PostsCommentsLib.comment[] public comments;

  function commentCount() public view returns (uint256) {
    return comments.length;
  }

  function getComments(uint256 commentRK) public view returns (PostsCommentsLib.comment memory comment) {
    return comments[commentRK];
  }

  function saveComment(PostsCommentsLib.comment memory newComment) public {
    comments.push(newComment);
  }

  /*
    @notice Update comment reference key.
    @dev An updated comment on IPFS will also have an updated reference key.
    @param currentCommentRK The old reference key to find comment reference to replace.
    @param newCommentRK The new reference key to replace with the old.
  */
  function updateCommentRK(uint256 currentCommentRK, uint256 newCommentRK) public {
    uint16 commentCounter = 0;

    for (uint256 i = 0; i < comments.length; i++) {
      if (comments[i].ipfsRK == currentCommentRK) {
        comments[i].ipfsRK = newCommentRK;
      } else {
        commentCounter++;
      }

      if (commentCounter == comments.length) {
        revert(string.concat(
          "No comment by the provided reference key of: ",
           Strings.toString(currentCommentRK)
        ));
      }
    }
  }
}