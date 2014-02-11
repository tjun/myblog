# config valid only for Capistrano 3.1
lock '3.1.0'

set :application,       'tjun.org'
set :use_sudo,          false

set :user,      'tjun'
set :group,     'tjun'
set :tmp,       '/tmp'
set :deploy_to, '/var/www/tjun.org'
set :source,    '_site'
set :archive_name, 'site.tar.gz'
set :url,       'http://tjun.org'

##
## delete default tasks
##
framework_tasks = [:starting, :started, :updating, :updated, :publishing, :published, :finishing, :finished]

framework_tasks.each do |t|
    Rake::Task["deploy:#{t}"].clear
end

Rake::Task[:deploy].clear


##
## build jekyll
##
task :update do
  desc 'Run jekyll to update site before uploading'
  source = fetch :source
  archive_name = fetch :archive_name

  run_locally do
    if test "[ -d #{source} ]"
      execute "rm -rf #{source}/*"
    else
      execute "mkdir -p #{source}"
    end
    if test "[ -e #{archive_name} ]"
      execute "rm -f #{archive_name}"
    end
    info "clean old files finished"
    execute "jekyll build"
    info "build jekyll finished"
  end
end

##
## create tar.gz
##
task :archive => :update do
  desc 'archive file in tar.gz'
  source = fetch :source
  archive_name = fetch :archive_name

  run_locally do
    execute "tar zcf #{archive_name} #{source}"
    info "create #{archive_name}"
  end
end

##
## upload and deploy
##
task :deploy => :archive do
  archive_file = fetch :archive_name
  deploy_to = fetch :deploy_to
  tmp = fetch :tmp
  source = fetch :source

  on roles(:web) do
    begin
      execute "rm -rf #{deploy_to}/*"
    rescue => e
      info "No previous release exists"
    end

    info "upload #{archive_file}"
    upload! archive_file, tmp
    execute "cd #{tmp} && tar zxf #{archive_file} && mv #{source}/* #{deploy_to} && ls #{deploy_to}"
  end
end

##
## check the recent post on top page
##
task :check do
  desc 'check recent post uploaded'
  url = fetch :url

  run_locally do
    info 'show recent posts on toppage'
    html = Nokogiri::HTML(open(url))
    html.css("li").css("a").each do |l|
      if l.attr("href").slice(1,4) == "blog"
        unless l.attr("href").slice(-3,3) == "rss"
          puts l
        end
      end
    end
  end
end

##
## clean up files on local and remote
##
task :cleanup do
  source = fetch :source
  archive_name = fetch :archive_name
  tmp = fetch :tmp

  run_locally do
    info "clean up local build"
    execute "rm -rf #{source}/*"
    execute "rm -f #{archive_name}"
  end

  on roles(:web) do
    info "clean up remote tmp file"
    execute "cd #{tmp} && rm -f #{archive_name} && rm -rf #{source}"
  end
end

after 'deploy', 'check'
after 'check', 'cleanup'
