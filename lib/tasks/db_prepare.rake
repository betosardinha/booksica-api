# frozen_string_literal: true

namespace :db do
  desc 'Prepare database for development and test environments'
  task prepare: %i[environment db:drop db:create db:migrate db:seed] do
    puts 'Database prepared'
  end
end
