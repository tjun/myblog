# Usage: rake preview
desc "Build files and launch preview server"
task :preview do
  sh "open -a 'Google\ Chrome' 'http://localhost:4000'"
  sh "jekyll --server --auto"
end

# Usage: rake post["title"]
desc "Create a new post file with title"
task :post do
  print 'title :'
  title = STDIN.gets.strip
  dirname = File.join(".", "_posts")
  if not FileTest.directory?(dirname)
    abort("rake aborted: #{dirname} directory not found.")
  end
  date = Time.now.strftime('%Y-%m-%d')
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = "#{date}-#{slug}.md"
  fullpath = File.join(dirname, filename)

  if File.exist?(fullpath)
    abort("rake aborted: #{fullpath} already exists.")
  end

  File.open(fullpath, 'w') do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "category: "
    post.puts "title: #{title}"
    post.puts "date: #{date}"
    post.puts "summary: "
    post.puts "---"
  end
  #puts "Open #{fullpath} in an editor."
  sh "open -a Mou #{fullpath}"
end

#Usage: rake sass
desc "convert scss to css"
task :sass do
  sh "sass --style compressed _scss/style.scss:css/style.css"
end

#Usage rake rsync:dryrun | rake rsync:live
namespace :rsync do
  desc "--dry-run rsunc"
  task :dryrun do
    system('rsync -avr -e ssh --dry-run --delete _site/ [user]@[host]:/var/www/')
  end
  desc "rsync"
  task :live do
    system('rsync -avr -e ssh --delete _site/ [user]@[host]:/var/www/')
  end
end

