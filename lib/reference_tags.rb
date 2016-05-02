module ReferenceTags
  extend ActiveSupport::Concern
  def add_reference_tags(reference, tags)
    return if tags.nil?

    tags.map(&:downcase).each do |t|
      if Tag.find_by(name: t)
        if reference.tags.find_by(name: t).nil?
          reference.tags << Tag.find_by(name: t)
        end
      else
        reference.tags.create(name: t)
      end
    end
    tags
  end

  def update_reference_tags(reference, new_tags)
    update_tags = add_reference_tags(reference, new_tags) || []

    delete_leftover_tags_from_reference(reference, update_tags)
  end

  def delete_leftover_tags_from_reference(reference, updated_tags)
    reference.tags.each do |t|
      unless updated_tags.include? t.name
        tag = Tag.find_by(name: t.name)
        reference.tags.delete(tag.id)
      end
    end
  end

  def convert_reference_tag_names_to_array(tags)
    tags.map(&:name)
  end

  def tags_to_string(tags)
    tags.join(' ')
  end
end