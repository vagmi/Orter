class User < ActiveRecord::Base
  validates_presence_of :provider, :uid, :name

  has_and_belongs_to_many :retros

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end

