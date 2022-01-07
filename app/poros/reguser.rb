class Reguser
  attr_reader :email, :name, :phone, :available, :trailer_capacity

  def initialize(data)
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
    @phone = data[:attributes][:phone]
    @available = data[:attributes][:is_available_for_missions]
    @trailer_capacity = data[:attributes][:rescuer_trailer_capacity]
  end
end
