require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
  test "it should reject an non-url" do 
    res = build(:resource)
    res.url = "abc"
    assert_not res.save, "Url is not an url"
  end
  test "it should require a name" do 
    res = build(:resource)
    res.name = nil
    assert_not res.save, "Name can't be blank"
  end
end
