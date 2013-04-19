require 'csv'
require 'pp'

namespace :github do

  desc 'Find our own followers, '
  task :getfollowers => :environment do

    github = Github.new

    users = github.users.followers.list 'kicadhub'


    users.each do |user|
      user_login = user.login

      repositories = github.repositories.list user:user_login

      puts "#{user_login}:"
      repositories.each do |repo|
        puts "\t#{repo.git_url}"
        puts %x[cd tmp; mkdir #{user_login}; cd #{user_login}; git clone --depth 1 #{repo.git_url}]
      end


    end


  end
end