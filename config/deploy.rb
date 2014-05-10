# config valid only for Capistrano 3.1
lock '3.2.1'

set :application,       'tjun.org'
set :use_sudo,          false

set :user,      'tjun'
set :group,     'tjun'
set :deploy_to, '/var/www/tjun.org'
set :target,    '_site'
set :url,       'http://tjun.org'

set :repo_url,   'https://github.com/tjun/myblog'
set :repo_name,  'blog'
set :repo_dir,   (fetch :tmp_dir) + '/blog'

##
## delete default tasks
##
framework_tasks = [:starting, :started, :updating, :updated, :publishing, :published, :finishing, :finished]

framework_tasks.each do |t|
    Rake::Task["deploy:#{t}"].clear
end

Rake::Task[:deploy].clear


##
## fetch from github
##
task :fetch do
  desc 'fetch from github'
  source = fetch :source
  repo_dir = fetch :repo_dir

  on roles(:web) do
    if test "[ -d #{repo_dir} ]"
      info "pull from github"
      execute "cd #{repo_dir}; git pull"
    else
      info "clone from github"
      execute "cd #{fetch :tmp_dir}; git clone #{fetch :repo_url} #{fetch :repo_name}"
    end
  end
end

##
## build jekyll
##
task :build => :fetch do
  desc 'build jekyll'
  repo_dir = fetch :repo_dir
  build_dir = repo_dir + "/" + (fetch :target)

  on roles(:web) do
    if test "[ -d #{build_dir} ]"
      execute "rm -rf #{build_dir}"
    end
    execute "mkdir -p #{build_dir}"
    info "bundle install"
    execute "source ~/.zshrc; cd #{repo_dir}; bundle install"
    info "build jekyll"
    execute "source ~/.zshrc; cd #{repo_dir}; rake build"
  end
end

##
## deploy to www dir
##
task :deploy => :build do
  deploy_to = fetch :deploy_to
  repo_dir = fetch :repo_dir
  target = fetch :target

  on roles(:web) do
    begin
      execute "rm -rf #{deploy_to}/*"
    rescue => e
      info "No previous release exists"
    end
    info "move files to #{deploy_to}"
    execute "cd #{repo_dir}; mv #{target}/* #{deploy_to} && ls #{deploy_to}"
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
  target = fetch :target
  repo_dir = fetch :repo_dir

  on roles(:web) do
    info "clean up remote file"
    execute "cd #{repo_dir} && rm -rf #{target}"
  end
end

after 'deploy', 'check'
after 'check', 'cleanup'

##
## update elasticsearch
##
task :update_es do
  desc 'update elasticsearch'
  repo_dir = fetch :repo_dir
  build_dir = repo_dir + "/" + (fetch :target)

  on roles(:web) do
    info "update elasticseaarch"
    execute "source ~/.zshrc; cd #{repo_dir}; rake elasticsearch"
  end
end
