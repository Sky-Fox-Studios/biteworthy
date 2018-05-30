include Rails.application.routes.url_helpers

class TagDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :image_tag

  def view_columns
    @view_columns ||= {
      edit:        { source: "Tag.id", orderable: false, cond: :eq },
      name:        { source: "Tag.name" },
      description: { source: "Tag.description" },
      variety:     { source: "Tag.variety", searchable: false },
      icon:        { source: "Tag.icon_file_name", orderable: false },
      delete:      { source: "Tag.id", orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        edit:        link_to('<i class="far fa-edit"></i>'.html_safe, edit_admin_tag_path(record)),
        name:        record.name,
        description: record.description,
        variety:     record.variety,
        icon:        image_tag(record.icon.url(:tiny), tooltip: record.name.tr("-", " ").capitalize, title: record.name.tr("-", " ").capitalize).html_safe,
        delete:      link_to('<i class="fa fa-trash"></i>'.html_safe, admin_tag_path(record), method: :delete, data: { confirm: 'Are you sure?' })
      }
    end
  end

  private

  def get_raw_records
    Tag.all
  end

end
