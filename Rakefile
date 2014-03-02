# Usage: rake preview
desc "Build files and launch preview server"
task :preview do
  sh "jekyll serve"
end

desc "Convert markdown to html"
task :build do
  sh "jekyll build"
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
  sh "subl #{fullpath} &"
end

desc "create a new slide with title"
task :slide do
  print 'title : '
  title = STDIN.gets.strip
  dirname = File.join(".", "slide")
  if not FileTest.directory?(dirname)
    abort("rake aborted: #{dirname} directory not found.")
  end
  slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  filename = "#{slug}.markdown"
  fullpath = File.join(dirname, filename)
  if File.exist?(fullpath)
    abort("rake aborted: #{fullpath} already exists.")
  end

  post = File.open(fullpath, 'w', 0666)
  begin
    post.puts "---"
    post.puts "layout: slide"
    post.puts "title: #{title}"
    post.puts "# you can choose style from [swiss, neon, web-2.0]"
    post.puts "style: swiss"
    post.puts "# you can choose transition from [fade, horizontal-slide, vertical-slide]"
    post.puts "transition: horizontal-slide"
    post.puts "---"
    post.puts ""
    post.puts "<section class=\"slide\">"
    post.puts ""
    post.puts "##{title} <br /> <em>@tjun</em>"
    post.puts "</section>"
    post.puts ""
    post.puts "<section class=\"slide\">"
    post.puts ""
    post.puts "## title2"
    post.puts ""
    post.puts "</section>"
  ensure
    post.close
  end
  #puts "Open #{fullpath} in an editor."
  #sh "open -a MarkdownNote #{fullpath}"
  sh "subl #{fullpath} &"
end

#Usage: rake less
desc "convert less to css"
task :less do
  sh "lessc -x _less/style.less > css/style.css"
end

#Usage: rake elasticsearch
desc "update elasticsearch"
task :elasticsearch do
  sh "jekyll build -p _esplugin"
end

#Usage rake deploy
desc "deploy with capistrano"
task :deploy do
  system('bundle exec cap production deploy')
  system('bundle exec cap production update_es')
end

#Usage rake deploy
desc "deploy with capistrano without elasticsearch update"
task :deploy_wo_es do
  system('bundle exec cap production deploy')
end
