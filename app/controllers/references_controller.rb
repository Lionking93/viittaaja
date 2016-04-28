class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]

  # GET /references
  # GET /references.json
  def index
    @books = Reference.includes(:tags).books
    @articles = Reference.includes(:tags).articles
    @inproceedings = Reference.includes(:tags).inproceedings
    @references = Reference.includes(:tags).all
  end

  # GET /references/1
  # GET /references/1.json
  def show
  end

  def nglist
  end

  # GET /references/new
  def new
    @tags = Tag.all
    @reference = Reference.new
  end

  # GET /references/1/edit
  def edit
    @tags = Tag.all
    @reference_tags = "" + reference_tags_to_string(@reference)
  end

  # POST /references
  # POST /references.json
  def create
    @reference = Reference.new(reference_params)
    respond_to do |format|
      if @reference.save
        add_reference_tags(@reference, params[:tags])
        @reference.update_attribute(:citation_key, @reference.generate_citation_key)
        format.html { redirect_to :root, notice: 'Reference was successfully created.' }
        format.json { render :show, status: :created, location: @reference }
      else
        @tags = Tag.all
        format.html { render :new }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /references/1
  # PATCH/PUT /references/1.json
  def update
    respond_to do |format|
      if @reference.update(reference_params)
        update_reference_tags(@reference, params[:tags])
        format.html { redirect_to references_path, notice: 'Reference was successfully updated.' }
        format.json { render :show, status: :ok, location: @reference }
      else
        @tags = Tag.all
        format.html { render :edit }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /references/1
  # DELETE /references/1.json
  def destroy
    @reference.destroy
    respond_to do |format|
      format.html { redirect_to references_url, notice: 'Reference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference
      @reference = Reference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reference_params
      params.require(:reference).permit(:user_id, :year, :publisher, :author, :journal, :title, :booktitle, :editor, :address, :organization, :pages, :volume,
       :number, :edition, :month, :series, :note, :reference_type, :key)
    end

    def add_reference_tags(reference, tags)
      if !tags.nil?
        tags.each do |t|
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

    def reference_tags_to_string(reference)
      tags = ""
      reference.tags.each do |t|
        if (tags == "") 
          tags = t.name
        else 
          tags += " " + t.name
        end
      end
      tags
    end
end
