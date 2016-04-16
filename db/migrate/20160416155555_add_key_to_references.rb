class AddKeyToReferences < ActiveRecord::Migration
  def change
    add_column :references, :key, :string
  end
end
