class Mission
  attr_reader :id, :rescuer_id, :evacuee_id

  def initialize(data)
    @id = data[:id].to_i
    @rescuer_id = data[:attributes][:user_id]
    @evacuee_id = data[:attributes][:farm_id]
  end

  def farm_address
    farm = FarmFacade.find_farm(@evacuee_id).address
  end

  def evacuee
    UserFacade.find_by_id(@evacuee_id)
  end  
end
