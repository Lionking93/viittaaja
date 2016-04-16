class AddVolumeNumberToReferences < ActiveRecord::Migration
  def change
    add_column :references, :volume_number, :string
  end
end
