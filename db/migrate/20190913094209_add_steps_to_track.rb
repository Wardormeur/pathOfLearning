class AddStepsToTrack < ActiveRecord::Migration[6.0]
  def change
    add_reference :steps, :track, :index => true, :foreign_key => true
  end
end
