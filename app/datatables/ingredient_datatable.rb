include Rails.application.routes.url_helpers

class IngredientDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to

  def view_columns
    @view_columns ||= {
      name:            { source: "Ingredient.name" },
      normalized_name: { source: "Ingredient.normalized_name" },
      tags:            { source: "Tag.name", searchable: false },
      actions:         { source: "Ingredient.id", orderable: false, cond: :eq }
    }
  end

  def data
    records.map do |record|
      {
        name:            link_to(record.name, ingredient_path(record)),
        normalized_name: record.normalized_name,
        tags:            record.tags.map(&:name).to_a.to_sentence,
        actions:         link_to('<i class="far fa-edit"></i>'.html_safe, edit_admin_ingredient_path(record)) +
                         link_to('<i class="far fa-trash"></i>'.html_safe, admin_ingredient_path(record), method: :delete, data: { confirm: 'Are you sure?' })
      }
    end
  end

  private

  def get_raw_records
    Ingredient.all
  end

end
