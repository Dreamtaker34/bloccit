class User < ActiveRecord::Base



  before_save { self.email = email.downcase }

# why can't you put it in a code block like ^
  before_save :proper_name

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }

  has_secure_password

  def proper_name
# why if?
    if name
      proper_array = []
      name.split.each do |s|
        proper_array << s.capitalize
      end
      self.name = proper_array.join(" ")
    end
  end
end
