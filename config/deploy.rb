set :application, "sv"
set :repository,  " your repository location here"

set :scm, :git

role :web, "sv.redinger.me"                          # Your HTTP server, Apache/etc
role :app, "sv.redinger.me"                          # This may be the same as your `Web` server
role :db,  "sv.redinger.me", :primary => true # This is where Rails migrations will run
set  :shared_path, "/home/george/workspace/sv"

desc "Tail all or a single remote file"
task :tail do
    ENV["LOGFILE"] ||= "*.log"
      run "tail -f #{shared_path}/log/production.log /opt/nginx/logs/sv*" do |channel, stream, data|
          puts "#{data}"
              break if stream == :err
      end
end
desc "Show application statistics in real-time"
task :watch_status, :roles => :app do
    count = 0
      last = Time.now
      run "tail -f /#{shared_path}/log/production.log" do |ch, stream, out|
        puts "#{ch[:host]}: #{out}" and break if stream == :err

        #count += 1 if out =~ / (\w+) \w+\[(\d+)\]: Completed in/
        count += 1 if out =~ /^Completed 200 OK in.*$/

        if Time.now - last >= 1
            puts "%2d rpm" % count
            count = 0
            last = Time.now
        end
     end
end

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

