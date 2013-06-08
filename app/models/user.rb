class User
  include Mongoid::Document
  field :name
  field :uid
  field :provider

  def self.find_or_create_from_auth_hash(auth_hash)
  	create! do |user|
	    user.provider = auth_hash["provider"]
	    user.uid = auth_hash["uid"]
	    user.name = auth_hash["info"]["name"]
	end
  end
end
