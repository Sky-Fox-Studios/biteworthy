class Admin::ExtrasAjaxController < Admin::ExtrasController
  before_action :just_set_extra, only: [
    :add_tag, :add_food,
    :add_new_food, :add_new_tag,
    :remove_tag, :remove_tags, :remove_food,
    :tag_up]

  def add_new_tag
    tag = Tag.find_or_initialize_by(name: params[:tag][:name].downcase)
    tag.update(description: params[:tag][:description])
    @extra.tags << tag unless @extra.tags.include? tag
    render partial: "admin/extras/tags/list", locals: {extra: @extra }
  end

  def add_tag
    unless (params[:tag_id].empty?)
      tag = Tag.find(params[:tag_id])
      @extra.tags << tag unless @extra.tags.include? tag
    end
    render partial: "admin/extras/tags/list", locals: {extra: @extra }
  end

  def remove_tag
    tag = Tag.find(params[:tag_id])
    @extra.tags.delete(tag)
    render partial: "admin/extras/tags/list", locals: {extra: @extra }
  end

  def remove_tags
    @extra.tags.clear
    render partial: "admin/extras/tags/list", locals: {extra: @extra }
  end

  def tag_up
    @extra.foods.each do |food|
      food.tags.each do |tag|
        @extra.tags << tag unless @extra.tags.include? tag
      end
    end
    render partial: "admin/extras/tags/list", locals: {extra: @extra }
  end

  def add_new_food
    food = Food.find_or_initialize_by(name: food_params[:name], restaurant: @extra.restaurant)
    food.update(food_params)
    @extra.foods << food unless @extra.foods.include? food
    render partial: "admin/extras/foods/list", locals: {extra: @extra }
  end

  def add_food
    unless (params[:food_id].empty?)
      food = Food.find(params[:food_id])
      @extra.foods << food unless @extra.foods.include? food
    end
    render partial: "admin/extras/foods/list", locals: {extra: @extra }
  end

  def remove_food
    food = Food.find(params[:food_id])
    @extra.foods.delete(food)
    render partial: "admin/extras/foods/list", locals: {extra: @extra }
  end

  def add_tags
    tags  = Tag.where(id: params[:tag_ids].split(","))
    extras = Extra.where(id: params[:extra_ids].split(","))
    extras.each do |extra|
      tags.each do |tag|
        unless extra.tags.include? tag
          extra.tags << tag
        end
      end
    end
    render html: "Updated: #{extras.map(&:name).to_sentence} with tags: #{tags.map(&:name).to_sentence}"
  end

  def tag_params
    params.require(:tag).permit(:name, :description, :variety, :icon, :user_id)
  end
end
