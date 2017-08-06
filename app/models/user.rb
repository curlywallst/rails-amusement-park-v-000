class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  # write associations here

    def mood
      if self.nausea > self.happiness
        return 'sad'
      else
        return 'happy'
      end
    end

    def admin?
      if self.admin
        true
      else
        false
      end
    end
end
