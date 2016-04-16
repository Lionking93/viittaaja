class AddReferenceTypeToReferences < ActiveRecord::Migration
  def change
    add_column :references, :reference_type, :string
  end
end
