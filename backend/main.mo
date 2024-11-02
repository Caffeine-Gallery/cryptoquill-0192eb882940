import Bool "mo:base/Bool";
import Int "mo:base/Int";
import Text "mo:base/Text";

import Time "mo:base/Time";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";

actor {
    // Post type definition
    public type Post = {
        title: Text;
        body: Text;
        author: Text;
        timestamp: Int;
    };

    // Stable variable to store posts
    stable var posts : [Post] = [];

    // Add a new post
    public shared func createPost(title: Text, body: Text, author: Text) : async Bool {
        let newPost : Post = {
            title = title;
            body = body;
            author = author;
            timestamp = Time.now();
        };

        let postsBuffer = Buffer.fromArray<Post>(posts);
        postsBuffer.add(newPost);
        posts := Buffer.toArray(postsBuffer);
        return true;
    };

    // Get all posts in reverse chronological order
    public query func getPosts() : async [Post] {
        let reversedPosts = Array.tabulate<Post>(posts.size(), func (i) {
            posts[posts.size() - 1 - i]
        });
        return reversedPosts;
    };
}
