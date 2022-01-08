class UserFacade
  class << self
    def user_by_email(email)
      data = UserService.get_data("users?email=#{email}")[:data]

      Reguser.new(data)
    end

    def farms
      farms = UserService.get_data("farms")[:data]

      farms.map do |farm|
        Farm.new(farm)
      end
    end

    def driving_directions(user1, user2)
      location1 = user1.address
      location2 = user2.address

      directions = MapService.farm_directions(location1, location2)

      directions.map do |dir|
        dir[:narrative]
      end
    end
  end
end
