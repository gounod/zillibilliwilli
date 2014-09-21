# encoding: utf-8

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

set :application, 'gounod'
set :repo_url, 'https://github.com/gounod/crm.git'

set :deploy_to, '/home/gounod/website'

set :scm, :git
set :bundle_flags, "--deployment --quiet --binstubs"

set :use_sudo, false
set :rbenv_ruby, '2.1.2'
set :rvm_type, :user                     # Defaults to: :auto
set :rvm_ruby_version, '2.1.2'      # Defaults to: 'default'

set :linked_files, %w{config/database.yml settings.yml config/unicorn/production.rb config/unicorn.rb}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/system}