# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( extjs/resources/css/ext-all.css )
Rails.application.config.assets.precompile += %w( adminjs/ext-all-debug.js )
Rails.application.config.assets.precompile += %w( adminjs/ext-lang-zh_CN.js )

Rails.application.config.assets.precompile += %w( css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( css/style.css )
Rails.application.config.assets.precompile += %w( css/bootstrap-datetimepicker.min.css )
Rails.application.config.assets.precompile += %w( js/jquery-2.1.1.min.js )
Rails.application.config.assets.precompile += %w( js/bootstrap.min.js)
Rails.application.config.assets.precompile += %w( js/bootstrap-datetimepicker.js)
Rails.application.config.assets.precompile += %w( js/bootstrap-filestyle.min.js)


Rails.application.config.assets.precompile += %w( adminpage/index.js )
Rails.application.config.assets.precompile += %w( adminpage/instrument.js )
Rails.application.config.assets.precompile += %w( adminpage/appointment.js )
Rails.application.config.assets.precompile += %w( adminpage/user.js )
Rails.application.config.assets.precompile += %w( adminpage/group.js )
Rails.application.config.assets.precompile += %w( adminpage/institution.js )
Rails.application.config.assets.precompile += %w( adminpage/regionCenter.js )
Rails.application.config.assets.precompile += %w( adminpage/aLevelTag.js )
Rails.application.config.assets.precompile += %w( adminpage/bLevelTag.js )
Rails.application.config.assets.precompile += %w( adminpage/role.js )
Rails.application.config.assets.precompile += %w( adminpage/privilige.js )