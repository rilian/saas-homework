class Class
  def attr_accessor_with_history(attr)
    attr = attr.to_s
    attr_reader attr
    attr_reader attr+"_history"
    class_eval %Q{
def #{attr}=(value)
if(!defined?(@#{attr}_history))
@#{attr}_history = [@#{attr}]
end

@#{attr} = value
@#{attr}_history << value
end
}
  end
end