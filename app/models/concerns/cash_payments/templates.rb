module CashPayments::Templates
  extend ActiveSupport::Concern

  def to_template ct
    ct.content % template_attrs
  end

  def template_attrs
    {
      nombres: nombres,
      apellidos: apellidos,
      nombre_completo: nombre_completo,
      tipo_documento: tipo_documento,
      nro_documento: nro_documento,
      nacionalidad: nacionalidad,
      fecha_nacimiento: fecha_nacimiento,
      lugar_nacimiento: lugar_nacimiento,
      correo_electronico: correo_electronico,
      estado_civil: estado_civil,
      ocupacion: ocupacion,
      nivel_estudios: nivel_estudios,
      direccion_completa: direccion_completa,
      telefono: telefono,
      ingreso_mensual: ingreso_mensual,
      adhiere_tarjeta: adhiere_tarjeta,
      asesor_originante: asesor_originante,
      fecha: fecha,
      monto: monto
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

    def nacionalidad
      customer.nacionality
    end

    def fecha_nacimiento
      I18n.l customer.birthdate
    end

    def lugar_nacimiento
      customer.place_birth
    end

    def correo_electronico
      customer.email
    end

    def estado_civil
      customer.marital_status
    end

    def ocupacion
      customer.occupation
    end

    def domicilio_laboral
      customer.work_address
    end

    def nivel_estudios
      customer.education_level
    end

    def ingreso_mensual
      customer.monthly_income
    end

    def direccion_completa
      customer.full_address
    end

    def telefono
      customer.cellphone
    end

    def adhiere_tarjeta
      customer.card
    end

    def asesor_originante
      customer.adviser
    end

    def monto
      ActionController::Base.helpers.number_to_currency amount
    end
end
