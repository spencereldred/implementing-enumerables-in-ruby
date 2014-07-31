module GschoolEnumerable

  def g_each &block
    for i in self
      block.call(i)
    end
    self
  end

  # def g_each
  #   for i in self
  #     yield i
  #   end
  #   self
  # end

  def g_select
    result = []
    self.each {|item| result << item if yield item }
    result
  end

  def g_reject
    result = []
    self.each {|item| result << item unless yield item }
    result
  end

  def g_map
    result = []
    self.each {|item| result << yield(item) }
    result
  end

  def g_find
    self.each {|item| return item if yield(item) }
    nil
  end

  def g_select!
    self.each {|item| self.delete(item) unless yield item }
  end

end
