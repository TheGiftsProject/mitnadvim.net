module ModalsHelper
  def modal(partial, name)
    render partial: "modals/#{partial}", layout: "layouts/modals/modal", locals: { attributes: {id: name}}
  end
end
