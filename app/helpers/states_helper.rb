module StatesHelper
  def state_cities state
    state ? state.cities : State.none
  end
end
