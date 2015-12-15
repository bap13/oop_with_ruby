class Array
  def all_empty?
    self.all? { |e| e.to_s.empty? }
  end

  def all_same?
    self.all? { |e| e == self[0] }
  end

  def any_empty?
    self.any? { |e| e.to_s.empty? }
  end

  def none_empty?
    self.none? { |e| e.to_s.empty? }
  end
end

