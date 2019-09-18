class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :url
      t.string :type_of
      t.string :name
      t.timestamps
    end
    add_reference :steps, :resource, :index => true, :foreign_key => true
  end
end
