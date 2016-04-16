class AddEditorToReferences < ActiveRecord::Migration
  def change
    add_column :references, :editor, :string
  end
end
