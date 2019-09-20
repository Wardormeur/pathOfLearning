class AddAncestryToSteps < ActiveRecord::Migration[6.0]
  def change
    add_column :steps, :ancestry, :string
    add_index :steps, :ancestry
  end
end
