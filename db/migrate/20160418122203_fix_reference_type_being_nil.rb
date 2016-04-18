class FixReferenceTypeBeingNil < ActiveRecord::Migration
  def change
    Reference.all.each do |ref|
      ref.update_attribute(:reference_type, 'book') if ref.reference_type.nil?
    end
  end
end
