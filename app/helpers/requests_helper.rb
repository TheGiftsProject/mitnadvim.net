module RequestsHelper

  def category_options(selected)
    options_from_collection_for_select(Category.all, :id, :name, selected)
  end

  def recurrence_options(selected)
    options_from_collection_for_select(Recurrence.all, :id, :name, selected)
  end

  def school_options(area, selected)
    options_from_collection_for_select(School.from_area(area), :id, :name, selected)
  end

  def weekday_options
    {
        0 => I18n.t('modals.weekly.weekday.sun'),
        1 => I18n.t('modals.weekly.weekday.mon'),
        2 => I18n.t('modals.weekly.weekday.tue'),
        3 => I18n.t('modals.weekly.weekday.wed'),
        4 => I18n.t('modals.weekly.weekday.thu'),
        5 => I18n.t('modals.weekly.weekday.fri')
    }
  end

end
