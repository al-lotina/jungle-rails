class Sale < ActiveRecord::Base

  def finished?
    self.ends_on < Date.current # self can be omited
  end

  def upcoming? # question mark methods imply that they should return a boolean 
    self.starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

  def self.active #class method
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

end
