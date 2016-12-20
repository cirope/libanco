module CashMemberPayments::Templates
  extend ActiveSupport::Concern

  def to_template ct
    ct.content % template_attrs
  end

  def template_attrs
    {
      fecha: fecha,
      nombres: nombres,
      apellidos: apellidos,
      nombre_completo: nombre_completo,
      tipo_documento: tipo_documento,
      nro_documento: nro_documento,
      periodo: periodo,
      monto: monto,
      fecha_vencimiento: fecha_vencimiento,
      fecha_pago: fecha_pago
    }
  end

  private

    def fecha
      I18n.l Date.today, format: :long
    end

    def nombres
      customer.name
    end

    def apellidos
      customer.lastname
    end

    def nombre_completo
      customer
    end

    def tipo_documento
      I18n.t "customers.identification_types.#{customer.identification_type}"
    end

    def nro_documento
      customer.identification
    end

    def monto
      ActionController::Base.helpers.number_to_currency amount
    end

    def periodo
      I18n.l period, format: :long_period
    end

    def fecha_vencimiento
      I18n.l expire_at
    end

    def fecha_pago
      I18n.l paid_at
    end
end
