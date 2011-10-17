class User < ActiveRecord::Base
  extend OmniauthCallbacks

  # Include default devise modules. Others available are:
  # :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable,
         :validatable, :confirmable, :token_authenticatable

  has_many :permissions

  attr_accessible :email, :password, :password_confirmation, :remember_me

  before_save :ensure_authentication_token

  def self.reset_request_count!
    update_all("request_count = 0", "request_count > 0")
  end

  def display_name
    if twitter_id
      "#{twitter_display_name} (@#{twitter_screen_name})"
    elsif github_id
      "#{github_display_name} (#{github_user_name})"
    else
      email
    end
  end

  def to_s
    "#{display_name} (#{admin? ? "Admin" : "User"})"
  end
end
