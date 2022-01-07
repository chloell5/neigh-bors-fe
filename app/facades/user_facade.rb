class UserFacade
  class << self
    def user_by_email(email)
      data = UserService.get_data("users?email=#{email}")[:data]

      User.new(data)
    end
  end
end
