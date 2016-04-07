class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :referencelist_id
      t.integer :year
      t.string :publisher
      t.string :author
      t.string :title
      t.string :address
      t.string :pages
      t.integer :volume
      t.string :edition
      t.integer :month
      t.integer :series
      t.string :note

      t.timestamps null: false
    end
  end
end
