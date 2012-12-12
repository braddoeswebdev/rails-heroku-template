desc "deploys to heroku after packaging & cleaning up assets"
task deploy: [:environment, 'assets:precompile'] do
	assetPath = "../#{Rails.application.class.to_s.split("::").first.downcase}-assets"
	puts `rm -r #{assetPath}`
	puts `cp -r public/assets #{assetPath}`
	puts `rake assets:clean`
	puts `mkdir public/assets`
	puts `cp #{assetPath}/manifest.yml public/assets/`
	puts `git push heroku master`
end