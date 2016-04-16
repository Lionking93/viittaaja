class AddOrganizationToReferences < ActiveRecord::Migration
  def change
    add_column :references, :organization, :string
  end
end
