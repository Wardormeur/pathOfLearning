require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  test "should not save without name" do
    track = Track.new
    assert_not track.save, "Saved track without name"
  end
  test "should not save without steps" do
    track = Track.new
    track.name = "Unity"
    assert_not track.save, "Saved track without steps"
  end
end
