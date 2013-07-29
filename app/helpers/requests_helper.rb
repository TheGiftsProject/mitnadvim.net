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

end
