class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validate :valid_email_domain

  def valid_email_domain
    valid_domains = ['bronxdefenders.org', 'michaelprude@gmail.com']
    if !domain_regex(valid_domains).match(self.email)
      errors.add(:email, "#{self.email.match(/(?<=@).+/).to_s} is not a valid domain")
    end
  end

  private

  def domain_regex(valid_domains)
    regex_domains = valid_domains.map{ |domain| Regexp.escape(domain) + '\z' }
    Regexp.new('('+regex_domains.join('|')+')')
  end
end
