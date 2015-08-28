class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  validate :valid_email_domain

  def valid_email_domain
    valid_domains = ['melissamunz@gmail.com', 'michaelprude@gmail.com']
    if !domain_regex(valid_domains).match(self.email)
      errors.add(:email, "#{self.email.match(/(?<=@).+/).to_s} is not a valid domain")
    end
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(
        email: data["email"],
        password: password,
        password_confirmation: password
      )
    end
    user
  end

  private

  def domain_regex(valid_domains)
    regex_domains = valid_domains.map{ |domain| Regexp.escape(domain) + '\z' }
    Regexp.new('('+regex_domains.join('|')+')')
  end
end
