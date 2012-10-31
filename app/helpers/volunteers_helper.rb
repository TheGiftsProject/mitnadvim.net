module VolunteersHelper

  def year_options(selected_year)
    years = *(1940..2000)
    options_for_select(years, selected_year)
  end

  def area_options(selected)
    options_from_collection_for_select(Area.all, :id, :name, selected)
  end

end