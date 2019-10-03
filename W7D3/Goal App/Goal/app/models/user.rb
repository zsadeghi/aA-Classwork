class User < ApplicationRecord

    validates :seesion_token, presence: true
    validates :username, uniqueness: true, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :password_digest, presence: { message: "Password can't be blank."}

    attr_reader :password

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user
        user.is_password?(password) ? user : nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(32)
    end

    def reset_session_token!
        self.session_token = self.class.generate_session_token

        while user.exists?(session_token: self.session_token)
            self.session_token = self.class.generate_session_token
        end

        self.save!

        self.session_token
    end


    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    
    
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
    
    private
    
    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end
    
end
