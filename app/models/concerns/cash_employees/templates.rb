module CashEmployees::Templates
  extend ActiveSupport::Concern

  def to_template ct
    ct.content % template_attrs
  end

  def template_attrs
    {
      nombres: nombres,
      apellidos: apellidos,
      nombre_completo: nombre_completo,
      cuil: cuil,
      periodo: periodo,
      fecha: fecha,
      monto: monto
    }
  end

  private

    def fecha
      I18n.l Date.today, format: :long
    end

    def nombres
      name
    end

    def apellidos
      lastname
    end

    def nombre_completo
      employee
    end

    def cuil
      tax_id
    end

    def periodo
      I18n.l period, format: :long_period
    end

    def monto
      ActionController::Base.helpers.number_to_currency amount
    end
end
