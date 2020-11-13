module SalesHelper
  def active_sale?
    Sale.active.any? # active is a class method in Sale model
  end
end