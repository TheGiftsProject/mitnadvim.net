module VolunteersHelper

  def birth_years(selected_year)
    years = *(1940..2000)
    options_for_select(years, selected_year)
  end

  def areas(selected)
    options_from_collection_for_select(Area.all, :id, :name, selected)
  end

end