class CustomerTemplate

  def initialize customer, str_template
    @str_template = str_template
    @customer = customer
  end

  def render
    @str_template % {
      nombres: nombres, apellidos: apellidos, direccion_completa: direccion_completa,
      telefono: telefono, fecha: fecha
    }
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
