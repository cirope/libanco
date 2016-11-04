module CardsHelper
  def active_cards
    Card.actives.map { |c| [c.name, c.id] }
  end
end
