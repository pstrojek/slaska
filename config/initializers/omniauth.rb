unless  Rails.env.test?
	Rails.application.config.middleware.use OmniAuth::Builder do
	  require 'openid/store/filesystem' 
	  provider :github, AppConfig.GITHUB_KEY, AppConfig.GITHUB_SECRET
	  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp')
	end
end
