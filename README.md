pluslog
=======

Ruby simple logger gem

[![Gem Version](https://badge.fury.io/rb/pluslog.png)](http://badge.fury.io/rb/pluslog)

Usage:
```ruby
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

# enter w [2013-09-08 16:25:04 +0300]
# | enter x [2013-09-08 16:25:04 +0300]
# | | enter z [2013-09-08 16:25:04 +0300]
# | | exit z [2013-09-08 16:25:04 +0300]
# | exit x [2013-09-08 16:25:04 +0300]
# exit w [2013-09-08 16:25:04 +0300]
```
## Thanks to
[Gosha Arinich](http://github.com/goshakkk)
