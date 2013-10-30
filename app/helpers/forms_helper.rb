module FormsHelper

  extend ComponentsHelper

  def form_text_field(label, field_name, value = nil, options = {}, &block)
    block_to_partial("components/form/text_field", {name: field_name, id: field_name, label: label, type: :text, value: value}.merge(options), &block)
  end

  def form_password_field(label, field_name, options = {}, &block)
    block_to_partial("components/form/text_field", {name: field_name, id: field_name, label: label, type: :password}.merge(options), &block)
  end

  def form_textarea_field(label, field_name, value, &block)
    block_to_partial("components/form/text_area_field", {:field_name => field_name, label: label, value: value}, &block)
  end

  def form_select_field(label, field, field_name, options)
    block_to_partial("components/form/select_field", {field: field, field_name: field_name, label: label, options: options})
  end

  def form_field_wrapper(label, field_name, &block)
    block_to_partial("components/form/field_wrapper", {field_name: field_name, label: label}, &block)
  end

  def form_submit_button(label, options)
    block_to_partial("components/form/submit_button", {options: options, label: label})
  end

end
