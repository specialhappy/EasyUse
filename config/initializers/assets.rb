# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( extjs/resources/css/ext-all.css )
Rails.application.config.assets.precompile += %w( adminjs/ext-all-debug.js )
Rails.application.config.assets.precompile += %w( adminjs/ext-lang-zh_CN.js )
Rails.application.config.assets.precompile += %w( adminpage/index.js )
Rails.application.config.assets.precompile += %w( adminpage/instrument.js )