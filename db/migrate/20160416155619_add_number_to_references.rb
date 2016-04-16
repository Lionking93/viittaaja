class AddNumberToReferences < ActiveRecord::Migration
  def change
    add_column :references, :number, :integer
  end
end
