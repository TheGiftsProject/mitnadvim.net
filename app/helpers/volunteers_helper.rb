module VolunteersHelper

  extend ComponentsHelper

  def volunteer_text_field(field_name, &block)
    block_to_partial("volunteers/control_field", {:field_name => field_name}, &block)
  end

end
