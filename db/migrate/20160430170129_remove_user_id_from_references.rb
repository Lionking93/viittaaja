class RemoveUserIdFromReferences < ActiveRecord::Migration
  def change
    remove_column :references, :user_id, :integer
  end
end
