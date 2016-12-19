module Customers::Templates
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
      fecha: fecha
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
      to_s
    end

    def tipo_documento
      I18n.t "customers.identification_types.#{identification_type}"
    end

    def nro_documento
      identification
    end

    def nacionalidad
      nacionality
    end

    def fecha_nacimiento
      I18n.l birthdate
    end

    def lugar_nacimiento
      place_birth
    end

    def correo_electronico
      email
    end

    def estado_civil
      marital_status
    end

    def ocupacion
      occupation
    end

    def domicilio_laboral
      work_address
    end

    def nivel_estudios
      education_level
    end

    def ingreso_mensual
      monthly_income
    end

    def direccion_completa
      full_address
    end

    def telefono
      cellphone
    end

    def adhiere_tarjeta
      card
    end

    def asesor_originante
      adviser
    end
end
