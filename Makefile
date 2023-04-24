clean: ## Cleans your flutter project's workspace
	flutter clean
	cd android; ./gradlew clean
	fastlane run clear_derived_data
	fastlane run clean_cocoapods_cache

format: ## Formats my codebase
	flutter format lib/ test/

lint: ## Lints the codebase
	flutter analyze

pubs: ## Installs the pubs
	flutter pub get

models: ## Generates files using build runner
	fvm flutter pub run build_runner build --delete-conflicting-outputs

prod_builds: ## Creates installers
	cd ios; bundle install
	cd ios; bundle exec fastlane build_production
	cd android; bundle install
	cd android; bundle exec fastlane build_production

deploy: 
	cd ios; bundle exec fastlane deploy
	cd android; bundle exec fastlane deploy

deploy_web:
	firebase deploy