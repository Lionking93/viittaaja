module ReferenceTags
	extend ActiveSupport::Concern
	def add_reference_tags(reference, tags)
      if !tags.nil?
        tags.each do |t|
          t.downcase
          if !Tag.find_by(name: t).nil?
            if @reference.tags.find_by(name: t).nil?
              @reference.tags << Tag.find_by(name: t)
            end 
          else          
            @reference.tags.create(name: t) 
          end
        end
        tags
      end
    end

    def update_reference_tags(reference, tags)
      update_tags = add_reference_tags(reference, tags)
      if update_tags.nil?
        update_tags = []
      end
      delete_reference_tags(reference, update_tags)
    end

    def delete_reference_tags(reference, tags)
      reference.tags.each do |t|
        if !tags.include? t.name
          tag = Tag.find_by(name: t.name)
          reference.tags.delete(tag.id)
        end
      end
    end

    def convert_reference_tag_names_to_array(tags)
      tag_names = []
      tags.each do |t|
        tag_names << t.name
      end
      tag_names
    end

    def tags_to_string(tags)
      tags_as_string = ""
      tags.each do |t|
        if (tags_as_string == "") 
          tags_as_string = t
        else 
          tags_as_string += " " + t
        end
      end
      tags_as_string
    end
end