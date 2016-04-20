class ChangeMonthToString < ActiveRecord::Migration
  def change
  	change_column :references, :month, :string
  end
end
