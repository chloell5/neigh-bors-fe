class UserFacade
  class << self
    def user_by_email(email)
      data = UserService.get_data("users?email=#{email}")
      User.new(data)
    end

    def all_users
      data = UserService.get_data("users")

      data.map do |user|
        User.new(user)
      end
    end

    def find_by_id(id)
      data = UserService.get_data("users/#{id}")

      User.new(data)
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
