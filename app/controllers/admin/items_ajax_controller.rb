class Admin::ItemsAjaxController < Admin::ItemsController

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

end
