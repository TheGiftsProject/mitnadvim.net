module VolunteersHelper

  extend ComponentsHelper

  def volunteer_field(field_name, type = "text")
    block_to_partial("volunteers/control_field", {:field_name => field_name, :type => type})
  end

  def volunteer_select_field(field_name, options)
    block_to_partial("volunteers/select_field", {:field_name => field_name, :options => options})
  end

end
