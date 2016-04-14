class DropTableReferencelists < ActiveRecord::Migration
  def change
    def up
      drop_table :referencelists
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
