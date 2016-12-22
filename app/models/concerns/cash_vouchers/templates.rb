module CashVouchers::Templates
  extend ActiveSupport::Concern

  def to_template ct
    ct.content % template_attrs(ct)
  end

  def template_attrs ct
    case ct.kind
      when 'capital_customer' then capital_customer_attrs
      when 'remittance_income' then remittance_income_attrs
      when 'remittance_outcome' then remittance_outcome_attrs
      when 'cash_outcome' then cash_outcome_attrs
    end
  end

  def capital_customer_attrs
    {
      nombres: nombres,
      apellidos: apellidos,
      nombre_completo: nombre_completo,
      tipo_documento: tipo_documento,
      nro_documento: nro_documento
    }.merge common_attrs
  end

  def remittance_income_attrs
    { banco: banco, cuenta: cuenta }.merge common_attrs
  end

  def remittance_outcome_attrs
    { banco: banco, cuenta: cuenta }.merge common_attrs
  end

  def cash_outcome_attrs
    {
      nombres: nombres,
      apellidos: apellidos,
      nombre_completo: nombre_completo,
      cuil: cuil
    }.merge common_attrs
  end

  private

    def common_attrs
      { fecha: fecha, cajero: cajero, monto: monto, comentario: comentario }
    end

    def fecha
      I18n.l Date.today, format: :long
    end

    def cajero
      user
    end

    def monto
      ActionController::Base.helpers.number_to_currency amount
    end

    def comentario
      comment
    end

    def nombres
      owner.name
    end

    def apellidos
      owner.lastname
    end

    def nombre_completo
      owner
    end

    def tipo_documento
      I18n.t "customers.identification_types.#{owner.identification_type}"
    end

    def nro_documento
      owner.identification
    end

    def banco
      owner.bank
    end

    def cuenta
      owner.account
    end

    def cuil
      owner.tax_id
    end
end
