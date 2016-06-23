class Proxy

  def initialize(target_object)
    @object = target_object
    @messages = Array.new()
    # ADD MORE CODE HERE

  end

  def method_missing(method_name, *arg)
  	@messages << method_name
  	@object.send(method_name,*arg)
  end

  def messages
  	@messages
  end

  def called?(method_name)
  	@messages.include?(method_name	)
  end

  def number_of_times_called(method_name)
  	@messages.count(method_name)
  end

  # WRITE CODE HERE
end

class Television
  attr_accessor :channel

  def power
    if @power == :on
      @power = :off
    else
      @power = :on
    end
  end

  def on?
    @power == :on
  end
end

