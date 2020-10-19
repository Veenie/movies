require './config/environment'

#app was not working when this was lower
use Rack::MethodOverride


if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use UsersController

use MoviesController

run ApplicationController
