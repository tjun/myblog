# config valid only for Capistrano 3.1
lock '3.1.0'

set :application,       'tjun.org'
set :repo_url,          'git@github.com:tjun/myblog.git'
set :scm,               :git
set :deploy_via,        :copy
set :copy_compression,  :gzip
set :use_sudo,          false

set :user,      'tjun'
set :group,     'tjun'
set :tmp,       '/tmp'
set :deploy_to, '/var/www/tjun.org'
set :source,    '_site'
set :archive_name, 'site.tar.gz'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

framework_tasks = [:starting, :started, :updating, :updated, :publishing, :published, :finishing, :finished]

framework_tasks.each do |t|
    Rake::Task["deploy:#{t}"].clear
end

Rake::Task[:deploy].clear

task :update do
  desc 'Run jekyll to update site before uploading'
  run_locally do
    source = fetch :source
    archive_name = fetch :archive_name
    if test "[ -d #{source} ]"
      execute "rm -rf #{source}/* && rm -f #{archive_name} && jekyll build"
      info "build jekyll finished"
    else
      error "You are in wrong directory?"
    end
  end
end

task :archive => :update do
  desc 'archive file in tar.gz'
  run_locally do
    source = fetch :source
    archive_name = fetch :archive_name

    execute "tar zcf #{archive_name} #{source}"
    info "create #{archive_name}"
  end
end

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

    upload! archive_file, tmp
    execute "cd #{tmp} && tar zxf #{archive_file} && mv #{source}/* #{deploy_to} && ls #{deploy_to}"
  end
end

