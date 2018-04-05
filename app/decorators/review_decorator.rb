class ReviewDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def max_icon(value)

  end

  def icon(value, up = true)
    case value
    when 5
      "<i class='fa fa-sun' data-fa-transform='up-4 left-6 grow-2' style='color:yellow;'></i>" +
        "<i class='fa fa-cloud' data-fa-transform='grow-6'></i>" +
       "<i class='fas fa-dove' data-fa-transform='shrink-5' style='color:white;'></i>"
    when 4
      "<i class='fa fa-heart'></i>"
    when 3
      "<i class='fa fa-trophy'></i>"
    when 2
      "<i class='fa fa-smile'></i>"
    when 1
      if up
        "<i class='fa fa-chevron-up'></i>"
      else
        "<i class='fa fa-chevron-down'></i>"
      end
    when 0
      "<i class='fa fa-meh'></i>"
    when -1
      if up
        "<i class='fa fa-chevron-up'></i>"
      else
        "<i class='fa fa-chevron-down'></i>"
      end
    when -2
      "<i class='fa fa-frown'></i>"
    when -3
      if up
        "<i class='fa fa-arrow-from-bottom'></i>"
      else
        "<i class='fa fa-arrow-from-top'></i>"
      end
    when -4
      "<i class='fa fa-trash-alt'></i>"
    when -5
      "<i class='fa fa-exclamation-triangle'></i>"
    when -6
      "<i class='fa fa-chevron-down'></i>"
    end
  end
end
