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

    def create_user(data)
      data = UserService.post_data("users?name=#{data[:name]}&email=#{data[:email]}&phone=#{data[:phone]}&address=#{data[:address]}")[:data]
      User.new(data)
    end

    def update_user(data, user_id)
      data = UserService.patch_data("users/#{user_id.to_i}?name=#{data[:name]}&rescuer_trailer_capacity=#{data[:rescuer_trailer_capacity]}&phone=#{data[:phone]}&address=#{data[:address]}")
    end

    def find_by_id(id)
      data = UserService.get_data("users/#{id}")
      User.new(data)
    end
  end
end
