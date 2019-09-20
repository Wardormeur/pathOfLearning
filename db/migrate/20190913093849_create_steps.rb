class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.integer :parent_id 
      t.string :name
      t.timestamps
    end
  end
end
