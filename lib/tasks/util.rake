namespace :util do
  
  #TODO build out this util to preform testing automation and deployments and server restarts, i
  
  desc "update"
   task :update do
      sh %{ bundle exec rake assets:precompile RAILS_ENV=production && git add . && git commit -m "work work work" && git push heroku master }
    end
end