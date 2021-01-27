require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "it doth not blow up" do
    get "/"

    assert_equal 200, status
    assert_select 'h2', 'Plan It!'
  end
end
