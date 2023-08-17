# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ENV['QUORACLONE_DATABASE_USERNAME'] = 'postgres'
ENV['QUORACLONE_DATABASE_PASSWORD'] = '12345'
