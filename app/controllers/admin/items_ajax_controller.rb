class Admin::ItemsAjaxController < Admin::ItemsController
  before_action :just_set_item, only: [
    :add_tag, :add_food,
    :add_new_food, :add_new_tag,
    :remove_tag, :remove_tags, :remove_food,
    :tag_up]

  def add_new_tag
    tag = Tag.find_or_initialize_by(name: tag_params[:name])
    tag.update(tag_params)
    @item.tags << tag unless @item.tags.include? tag
    render partial: "admin/items/tags/list", locals: {item: @item }
  end

  def add_tag
    unless (params[:tag_id].empty?)
      tag = Tag.find(params[:tag_id])
      @item.tags << tag unless @item.tags.include? tag
    end
    render partial: "admin/items/tags/list", locals: {item: @item }
  end

  def remove_tag
    tag = Tag.find(params[:tag_id])
    @item.tags.delete(tag)
    render partial: "admin/items/tags/list", locals: {item: @item }
  end

  def remove_tags
    @item.tags.clear
    render partial: "admin/items/tags/list", locals: {item: @item }
  end

  def tag_up
    @item.foods.each do |food|
      food.tags.each do |tag|
        @item.tags << tag unless @item.tags.include? tag
      end
    end
    @item.ingredients.each do |ingredient|
      ingredient.tags.each do |tag|
        @item.tags << tag unless @item.tags.include? tag
      end
    end
    render partial: "admin/items/tags/list", locals: {item: @item }
  end

  def add_new_food
    food = Food.find_or_initialize_by(name: food_params[:name], restaurant: @item.restaurant)
    food.update(food_params)
    @item.foods << food unless @item.foods.include? food
    render partial: "admin/items/foods/list", locals: {item: @item }
  end

  def add_food
    unless (params[:food_id].empty?)
      food = Food.find(params[:food_id])
      @item.foods << food unless @item.foods.include? food
    end
    render partial: "admin/items/foods/list", locals: {item: @item }
  end

  def remove_food
    food = Food.find(params[:food_id])
    @item.foods.delete(food)
    render partial: "admin/items/foods/list", locals: {item: @item }
  end

  def add_tags
    tags  = Tag.where(id: params[:tag_ids].split(","))
    items = Item.where(id: params[:item_ids].split(","))
    items.each do |item|
      tags.each do |tag|
        unless item.tags.include? tag
          item.tags << tag
        end
      end
    end
    render html: "Updated: #{items.map(&:name).to_sentence} with tags: #{tags.map(&:name).to_sentence}"
  end
end
