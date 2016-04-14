class EditReferencesToPointToUserInsteadOfReferencelist < ActiveRecord::Migration
  def change
    remove_column :references, :referencelist_id, :integer
    add_column :references, :user_id, :integer
    add_index :references, :user_id
  end
end
