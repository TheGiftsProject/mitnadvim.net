module UsersHelper

  def gender_options(selected)
    genders = {
      :male => t("users.genders.male"),
      :female => t("users.genders.female")
    }

    options_from_collection_for_select(genders, :first, :second, selected)
  end

  def year_options(selected_year)
    years = *(1940..2000)
    options_for_select(years, selected_year)
  end

  def area_options(selected)
    options_from_collection_for_select(Area.all, :id, :name, selected)
  end

  def school_options(selected)
    options_from_collection_for_select(School.all, :id, :name, selected)
  end

end
