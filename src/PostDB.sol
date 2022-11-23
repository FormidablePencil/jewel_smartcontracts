// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./Comment.sol";
import "forge-std/console.sol";

  /**
   * @title ContractName
   * @dev ContractDescription
   * @custom:dev-run-script file_path
   */
contract PostDB {
  mapping (uint256 => Post) public post;
  mapping (uint256 => bool) public existentPost;
  mapping (address => uint256[]) public commentsRefKeys;

  event PostCreated(uint256 _post);

  /// @notice Explain to an end user what this does
  /// @dev Explain to a developer any extra details
  /// @param postRK a parameter just like in doxygen (must be followed by parameter name)
  //TODO 
  function createPost(uint256 postRK) public {
    //TODO - overriding posts
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

    // emit PostCreated(post[postRK]); 
    // if (post[postRK] != null) {
    //   post[postRK] = Post();
    // } 
  }

  function uploadRefKeyComment(uint256 postRK, uint256 commentRefKey) public {
    // add ref ipfs pub key to state
    post[postRK].uploadCommentRefKey(commentRefKey);
  }

  function getCommentsOfPost()public view returns (uint) {
    
  }
}

contract Post {
  mapping (uint256 => Comment) public comments;

  function uploadCommentRefKey(uint256 commentRefKey) public {
    // comments.commentsRefKeys[msg.sender].push(commentRefKey);
    Comment com = comments[commentRefKey];
    com.uploadCommentRefKey(commentRefKey);
  }
}