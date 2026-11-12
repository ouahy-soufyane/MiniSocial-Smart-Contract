// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MiniSocial {

    struct Post {
        string message;
        address author;
    }

    Post[] public posts;

    function publishPost(string memory _message) public {

        Post memory newPost = Post({
            message: _message,
            author: msg.sender
        });

        posts.push(newPost);
    }

    function getPost(uint index)
        public
        view
        returns (string memory, address)
    {
        Post memory post = posts[index];

        return (post.message, post.author);
    }

    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}
