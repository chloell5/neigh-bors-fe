class Reguser
  attr_reader :id, :name, :email, :phone, :available, :trailer_capacity, :address

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
    @phone = data[:attributes][:phone]
    @available = data[:attributes][:is_available_for_missions?]
    @trailer_capacity = data[:attributes][:rescuer_trailer_capacity]
    @address = data[:attributes][:address]
  end

  def farm
    farms = UserFacade.farms

    farm = farms.map do |farm|
      if farm.user_id == @id.to_i
        farm
      end
    end
    farm.first
  end

end
