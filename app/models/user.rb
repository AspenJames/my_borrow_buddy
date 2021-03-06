class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :name, presence: true
    validates :username, presence: true
    validates :password, presence: true
    has_many :items
    has_many :transactions, through: :items
    
    def self.find_or_create_by_oauth(auth_hash)
        self.where(email: auth_hash.extra.raw_info.email).first_or_create do |user|
            user.name = auth_hash.extra.raw_info.name
            user.username = "#{auth_hash.extra.raw_info.name}#{user.name.length}"
            user.password = SecureRandom.hex
        end
    end
    
end
