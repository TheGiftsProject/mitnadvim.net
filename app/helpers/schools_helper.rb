module SchoolsHelper

  extend FormsHelper

  def areas_options(selected)
    options_from_collection_for_select( Area.all, :id, :name, selected)
  end
end
