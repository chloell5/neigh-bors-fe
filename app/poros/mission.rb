class Mission
  attr_reader :id, :rescuer_id, :evacuee_id

  def initialize(data)
    @id = data[:id].to_i
    @rescuer_id = data[:attributes][:user_id]
    @evacuee_id = data[:attributes][:farm_id]
  end
end
