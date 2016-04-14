class AddDefaultUserIdToCurrentReferences < ActiveRecord::Migration
  def change
    user = User.first

    Reference.all.each do |ref|
      ref.update_attribute(:user, user)
    end
  end
end
