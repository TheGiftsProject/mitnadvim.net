module ModalsHelper
  def modal(partial, name, params)
    default_params = {
        partial: "modals/#{partial}",
        layout: "layouts/modals/modal"
    }.merge(params)
    default_params[:locals].merge!({attributes: {id: name}})
    render default_params
  end
end
