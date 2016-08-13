module CitiesHelper
  def cities_collection
    @cities.map { |c| [c.name, c.id] }
  end
end
