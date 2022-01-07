class User
  attr_reader :email, :name, :phone

  def initialize(data)
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
    @phone = data[:attributes][:phone]
  end
end
