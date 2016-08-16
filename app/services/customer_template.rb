class CustomerTemplate < Mustache

  def initialize customer, template
    self.template = template
    @customer = customer
  end

  def fecha
    I18n.l Date.new
  end

  def nombres
    @customer.name
  end

  def apellidos
    @customer.lastname
  end

  def direccion_completa
    @customer.full_address
  end

  def telefono
    @customer.phone
  end
end
