module UsersHelper

  def gender_options(selected)
    genders = {
      :male => t("users.genders.male"),
      :female => t("users.genders.female")
    }

    options_from_collection_for_select(genders, :first, :second, selected)
  end

end
