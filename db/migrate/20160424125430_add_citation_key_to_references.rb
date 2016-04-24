class AddCitationKeyToReferences < ActiveRecord::Migration
  def change
    add_column :references, :citation_key, :string
  end
end
