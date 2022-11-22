// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Post {
  mapping (address => uint256[]) public commentsRefKeys;

  // struct PostData {
  //   uint256[] commentRefKey;
  //   // uint256 commentRefKey;
  // }

  uint256 comments;
  // mapping (uint256 => PostDat) post;
  mapping (uint256 => PostData) post;
  // mapping (uint256 => uint256) post2;


  function addComment(uint256 postRefKey, uint256 commentRefKey) public {
    // add ref ipfs pub key to state
    // post2[postRefKey] = 1;
    PostData postData =  new PostData();
    postData.updateCommentRefKey(commentRefKey);
    comments = 1;

    // postData.post[commentRefKey];
    postData.commentsRefKeys = commentRefKey;
    post[postRefKey] = postData;
  }

  function getCommentsOfPost()public view returns (uint) {

  }
}