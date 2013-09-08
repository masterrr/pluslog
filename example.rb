require 'pluslog'

class My
  +def w
    x
  end

  +def x
    y
  end

  def y
    z
  end

  +def z
  end
end 

My.new.w

puts Pluslogger.get_pretty_trace(Thread.current)
