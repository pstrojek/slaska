class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :uid, type: String
  field :provider, type: String
  field :admin, type: Boolean, default: false

  validates :name, length: { in: 1..100 }

  def self.find_or_create_from_auth_hash(auth_hash)
    user = find_or_initialize_by(provider: auth_hash["provider"], uid: auth_hash["uid"])

    if !user.persisted?
      user.name = auth_hash["info"]["name"]
      user.save
    end
    user
  end

  def is_admin?
    self.admin
  end
end
