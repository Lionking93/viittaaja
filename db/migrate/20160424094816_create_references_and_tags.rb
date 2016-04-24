class CreateReferencesAndTags < ActiveRecord::Migration
  def change
    create_table :references_tags, id: false do |t|
    	t.belongs_to :reference, index: true
    	t.belongs_to :tag, index: true
    end
  end
end
