class User < ApplicationRecord
    validates :email, :session_token, :password_digest, presence: true
    validates :email, :session_token, uniqueness: true
    validates :password, length: {minimum: 6, allow_nil: true }

    after_initialize :ensure_session_token

    attr_reader :password

    def password=(password)
        @password = password
        self.password_digest = Bcrypt::Password.create(password)    
    end

    def self.find_by_credentials(email, password)
        @user = User.find_by(email: email)

        if @user && User.is_password?(password)
            return @user 
        else
          return nil
        end
    end

    def is_password?(password)
      Bcrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token ||= SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
      self.session_token ||= SecureRandom::urlsafe_base64
    end

end
