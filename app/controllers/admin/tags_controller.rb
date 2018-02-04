class Admin::TagsController < AdminController
 before_action :set_tag, only: [:edit, :update, :destroy]

 def index
   @tags = Tag.order(name: :asc)
 end

 def new
   @tag = Tag.new
 end

 def edit
 end

 def create
    @tags = []
    tags = Tag.save_tags(tag_params[:name])
    tags.each do |tag|
       @tags << tag if tag.valid? && tag.save
    end
    if !@tags.empty?
       redirect_to admin_tags_path, notice: 'Tag(s) successfully created.'
   else
       redirect_to new_admin_tag_path, notice: 'Tag creation error.'
   end
 end

 def update
   binding.pry
   if @tag.update(tag_params)
     redirect_to admin_tags_path, notice: 'The tag was successfully updated.'
   else
     render action: 'edit'
   end
 end

 def destroy
   @tag.destroy
   redirect_to admin_tags_path, notice: 'Tag was successfully deleted.'
 end

 private

 # Use callbacks to share common setup or constraints between actions.
 def set_tag
   @tag = Tag.find(params[:id])
 end

 # Only allow a trusted parameter "white list" through.
 def tag_params
   params.require(:tag).permit(:name, :description, :type)
 end
end
