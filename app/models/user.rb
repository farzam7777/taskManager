class User < ActiveRecord::Base
  validates :email, presence: {message: "You must provide an email Id. "}, uniqueness: true

  #before_validation :ensure_login_is_not_blank

   before_create do
      if login.nil?
        self.login = email unless email.blank?
      end 
   end

  # def ensure_login_is_not_blank
  #   if login.nil?
  #     self.login = email unless email.blank?
  #   end  
  # end
end
