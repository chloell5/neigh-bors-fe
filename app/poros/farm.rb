class Farm
  attr_reader :name,
              :address,
              :animals,
              :backend_id,
              :special_needs,
              :special_needs_details,
              :user_id

  def initialize(data)
    @backend_id = data[:id].to_i
    @name = data[:attributes][:name]
    @address = data[:attributes][:address]
    @animals = data[:attributes][:number_of_animals]
    @special_needs = data[:attributes][:special_needs?]
    @special_needs_details = data[:attributes][:special_needs_details]
    @user_id = data[:attributes][:user_id]
  end
end
