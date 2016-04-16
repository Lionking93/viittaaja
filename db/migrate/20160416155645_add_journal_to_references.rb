class AddJournalToReferences < ActiveRecord::Migration
  def change
    add_column :references, :journal, :string
  end
end
