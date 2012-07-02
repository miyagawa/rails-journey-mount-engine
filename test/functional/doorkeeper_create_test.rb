require 'test_helper'

module Doorkeeper
  class TokensControllerTest < ActionController::TestCase
    test "should fail" do
      post :create
      assert_response :unauthorized
    end
  end
end
