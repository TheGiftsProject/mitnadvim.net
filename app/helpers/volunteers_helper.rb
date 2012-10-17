module VolunteersHelper

  extend ComponentsHelper

  def volunteer_field(user, field, field_name, type = "text")
    block_to_partial("volunteers/text_field", {:user => user, :field => field, :field_name => field_name, :type => type})
  end

  def volunteer_select_field(user, field, field_name, options)
    block_to_partial("volunteers/select_field", {:user => user, :field => field, :field_name => field_name, :options => options})
  end

  def field_wrapper(field_name, &block)
    block_to_partial("volunteers/field_wrapper", {:field_name => field_name}, &block)
  end

end
