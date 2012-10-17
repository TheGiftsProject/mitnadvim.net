module ComponentsHelper

  def block_to_partial(partial_name, opts = {}, &block)
    if block.present?
      options = {:body => capture(&block), :opts => opts}
    else
      options = {:opts => opts}
    end

    render(:partial => partial_name, :locals => options)
  end

end