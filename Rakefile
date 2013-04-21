# Usage: rake preview
desc "Build files and launch preview server"
task :preview do
  sh "jekyll --server --auto"
end

desc "Convert markdown to html"
task :convert do
  sh "jekyll --auto --no-server"
end

# Usage: rake post["title"]
desc "Create a new post file with title"
task :post do
  print 'title : '
  title = STDIN.gets.strip
  dirname = File.join(".", "_posts")
  if not FileTest.directory?(dirname)
    abort("rake aborted: #{dirname} directory not found.")
  end
  date = Time.now.strftime('%Y-%m-%d')
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = "#{date}-#{slug}.markdown"
  fullpath = File.join(dirname, filename)

  if File.exist?(fullpath)
    abort("rake aborted: #{fullpath} already exists.")
  end

  post = File.open(fullpath, 'w', 0666)
  begin
    post.puts "---"
    post.puts "layout: post"
    post.puts "category: "
    post.puts "title: #{title}"
    post.puts "date: #{date}"
    post.puts "description: "
    post.puts "keywords: "
    post.puts "---"
  ensure
    post.close
  end
  #puts "Open #{fullpath} in an editor."
  #sh "open -a MarkdownNote #{fullpath}"
  emacs #{fullpath} &
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
    system('rsync -avr -e "ssh -p 22222" --dry-run --delete _site/ tjun@tjun.org:/var/www/tjun.org/')
  end
  desc "rsync"
  task :live do
    system('rsync -avr -e "ssh -p 22222" --delete _site/ tjun@tjun.org:/var/www/tjun.org/')
  end
end

