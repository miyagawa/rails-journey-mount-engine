This is to demonstrate a possible regression with journey 1.0.4 that
causes issues with controller tests with mounted engines.

https://github.com/rails/journey/commit/45d4e9eb7bd5143251b1c884e6a0f23828c0ece7

```
rake db:migration
rake
```

and you'll see the test failure:

```
Finished tests in 0.013233s, 75.5687 tests/s, 0.0000 assertions/s.

  1) Error:
test_should_fail(Doorkeeper::TokensControllerTest):
ActionController::RoutingError: No route matches {:controller=>"doorkeeper/tokens", :action=>"create"}
    /Users/miyagawa/.rvm/gems/ruby-1.9.3-p125/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:532:in `raise_routing_error'
    /Users/miyagawa/.rvm/gems/ruby-1.9.3-p125/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:528:in `rescue in generate'
    /Users/miyagawa/.rvm/gems/ruby-1.9.3-p125/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:520:in `generate'
    /Users/miyagawa/.rvm/gems/ruby-1.9.3-p125/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:561:in `generate'
    /Users/miyagawa/.rvm/gems/ruby-1.9.3-p125/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:557:in `generate_extras'
    /Users/miyagawa/.rvm/gems/ruby-1.9.3-p125/gems/actionpack-3.2.6/lib/action_dispatch/routing/route_set.rb:553:in `extra_keys'
    /Users/miyagawa/.rvm/gems/ruby-1.9.3-p125/gems/actionpack-3.2.6/lib/action_controller/test_case.rb:147:in `assign_parameters'
    /Users/miyagawa/.rvm/gems/ruby-1.9.3-p125/gems/actionpack-3.2.6/lib/action_controller/test_case.rb:459:in `process'
    /Users/miyagawa/.rvm/gems/ruby-1.9.3-p125/gems/actionpack-3.2.6/lib/action_controller/test_case.rb:49:in `process'
    /Users/miyagawa/.rvm/gems/ruby-1.9.3-p125/gems/actionpack-3.2.6/lib/action_controller/test_case.rb:391:in `post'
    /Users/miyagawa/dev/rails-journey-mount-engine/test/functional/doorkeeper_create_test.rb:6:in `block in <class:TokensControllerTest>'
```

With journey 1.0.3 (uncomment the line in `Gemfile` and run `bundle update journey`) the test passes.
