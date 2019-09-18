class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.integer :parent_id 
      t.string :name
      t.integer :lft 
      t.integer :rgt 
      t.integer :depth 
      t.integer :children_count 
      t.timestamps
    end
    Step.reset_column_information
    Step.rebuild!
  end
end
