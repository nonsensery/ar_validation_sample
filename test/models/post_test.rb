require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'duplicate tag is detected when added to new post' do
    tag = Tag.first

    # Create a new post:
    post = Post.new

    # Add a tag:
    post.post_tags.new tag: tag

    # Post should be valid
    assert post.valid?

    # Add a duplicate tag:
    post.post_tags.new tag: tag

    # Check validity:
    assert (post.valid? == false), 'Post is valid dispite duplicate tags'
  end

  test 'duplicate tag prevents saving' do
    tag = Tag.first

    # Create a new post:
    post = Post.new

    # Add a tag:
    post.post_tags.new tag: tag

    # Add a duplicate tag:
    post.post_tags.new tag: tag

    # Check savability:
    assert (post.save == false), 'Saved post dispite duplicate tags'
  end

  test 'saving the post should save all post-tags, or the save should fail' do
    tag = Tag.first

    # Create a new post:
    post = Post.new

    # Add a tag:
    post.post_tags.new tag: tag

    # Add a duplicate tag:
    post.post_tags.new tag: tag

    # Save the post:
    post.save!

    # Check whether the first post-tag was saved:
    assert (post.post_tags.first.id != nil), 'Saved post, but not first duplicate post-tag'

    # Check whether the second post-tag was saved:
    assert (post.post_tags.second.id != nil), 'Saved post, but not second duplicate post-tag'
  end

  test 'saving the post should not change the detection of duplicate tags' do
    tag = Tag.first

    # Create a new post:
    post = Post.new

    # Add a tag:
    post.post_tags.new tag: tag

    # Add a duplicate tag:
    post.post_tags.new tag: tag

    # Record the validity before saving
    was_valid = post.valid?

    # Save the post:
    post.save!

    # Check the validity after saving
    is_valid = post.valid?

    # Validity should not change!
    assert (was_valid == is_valid), "Saving post changed its validity from #{was_valid} to #{is_valid}"
  end
end
