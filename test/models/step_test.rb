require 'test_helper'

class StepTest < ActiveSupport::TestCase
  test "it must have a resource" do
    step = build(:step)
    step.resource = nil
    assert_not step.save
  end
  test "it can belong to a track" do
    track = create(:track)
    assert_not_nil track.step
  end
  test "it should default the step name to the resource name" do
    step = build(:unnamed_step)
    assert_not_nil step.name, "HTML Tutorial"
  end
end
