require "test_helper"

class ServerTest < ActiveSupport::TestCase
  test "fixtures are loaded" do
    result = Server.first

    assert(result.name == "trinity")
  end
end
