class RegenerateCitationKeys < ActiveRecord::Migration
  def change
    Reference.all.each { |ref| ref.update_attribute(:citation_key, '') }
    Reference.all.each { |ref| ref.update_attribute(:citation_key, ref.generate_citation_key) }
  end
end
