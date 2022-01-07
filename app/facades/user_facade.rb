class UserFacade
  class << self
    def user_by_email(email)
      data = UserService.get_data("users?email=#{email}")[:data]

      Reguser.new(data)
    end
  end
end
