module ModalsHelper
  def modal(partial, name, params)
    default_params = {
        partial: "modals/#{partial}",
        layout: "layouts/modals/modal",
        locals: {attributes: {id: name}}
    }.merge(params)

    render default_params
  end
end
