This is a sample project that shows a weird Active Record issue. I consider it a bug.

## Usage:

```sh
bundle install
rake test
```

or:

```sh
docker build -t ar_validation_sample .
docker run --rm -it ar_validation_sample
```

You should see output like this:

```
Run options: --seed 36592

# Running:

FFFF

Finished in 0.145570s, 27.4781 runs/s, 41.2172 assertions/s.

  1) Failure:
PostTest#test_saving_the_post_should_save_all_post-tags,_or_the_save_should_fail [/code/test/models/post_test.rb:58]:
Saved post, but not second duplicate post-tag


  2) Failure:
PostTest#test_duplicate_tag_is_detected_when_added_to_new_post [/code/test/models/post_test.rb:20]:
Post is valid dispite duplicate tags


  3) Failure:
PostTest#test_duplicate_tag_prevents_saving [/code/test/models/post_test.rb:36]:
Saved post dispite duplicate tags


  4) Failure:
PostTest#test_saving_the_post_should_not_change_the_detection_of_duplicate_tags [/code/test/models/post_test.rb:83]:
Saving post changed its validity from true to false

4 runs, 6 assertions, 4 failures, 0 errors, 0 skips
```


