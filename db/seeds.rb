Apartment::Tenant.switch! 'public'

Account.create! name: 'Continental', subdomain: 'prestamos'

Apartment::Tenant.switch! 'prestamos'

state = State.create! name: 'Mendoza'
City.create! name: 'Mendoza', state: state
Occupation.create! name: 'Abogado'
Neighborhood.create! name: 'Palermo'
Nacionality.create! name: 'Argentino'
MaritalStatus.create! name: 'Soltero'
EducationLevel.create! name: 'Primario'
Adviser.create!(
  name: 'Asesor Nombre',
  lastname: 'Asesor Apellido',
  identification_type: 'dni',
  identification: '27567456',
  phone: '278778722'
)
