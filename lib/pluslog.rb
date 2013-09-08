class Object
  def self.method_added(name)
    Thread.current[:method] = [self, name]
    super
  end
end

def nil.+@
  klass, name = Thread.current[:method]
  method = klass.instance_method(name)
  klass.send(:define_method, name) do |*args, &block|
    Pluslogger.log "enter #{name}"
    res = Pluslogger.new { method.bind(self).call(*args, &block) }
    Pluslogger.log "exit #{name}"
    res 
  end
end

class Pluslogger
  def self.get_pretty_trace(thread = Thread.current)
    thread[:log_buffer]
  end

  def self.log(string)
    Thread.current[:log_buffer] ||= ""
    depth = Thread.current[:depth] || 0
    Thread.current[:log_buffer] += "#{'| ' * depth}#{string} [#{Time.now}]\n"
  end

  def self.new(&block)
    Thread.current[:depth] ||= 0
    Thread.current[:depth] += 1
    res = block.call
    Thread.current[:depth] -= 1
    res
  end
end
