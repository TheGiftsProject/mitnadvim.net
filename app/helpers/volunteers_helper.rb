module VolunteersHelper

  def year_options(selected_year)
    years = *(1940..2000)
    options_for_select(years, selected_year)
  end

  def area_options(selected)
    options_from_collection_for_select(Area.all, :id, :name, selected)
  end

  def gender_options(selected)
    genders = {
      :male => t("users.new.genders.male"),
      :female => t("users.new.genders.female")
    }

    options_from_collection_for_select(genders, :first, :second, selected)
  end

end