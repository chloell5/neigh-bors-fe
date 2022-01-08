class Mission
  attr_reader :rescuer_id, :evacuee_id

  def initialize(data)
    @rescuer_id = data[:attributes][:user_id]
    @evacuee_id = data[:attributes][:farm_id]
  end
end
