# assumes:
# * current directory name is gem name, eg 'cx-finance'
# * gem name has syntax "#{lib_prefix}-#{lib_module}"
# * sub directories are "lib/#{lib_prefix}/#{lib_module}"
# * version is stored in file "lib/#{lib_prefix}/#{lib_module}/version.rb"
# * gem namespace module is "#{lib_prefix.capitalize}::#{lib_module.capitalize}"
# * version string is const_get("#{lib_prefix.upcase}::#{lib_module.capitalize}")"::VERSION

gem_name = Dir.pwd.split('/').last
lib_prefix = gem_name.split('-').first
lib_module = gem_name.split('-').last

require_relative "./lib/#{lib_prefix}/#{lib_module}/version"
gem_module = Kernel.const_get("#{lib_prefix.capitalize}::#{lib_module.capitalize}")
gem_version = gem_module::VERSION

task :version do
  puts "#{gem_name}-#{gem_version}"
end

task :commit do
  sh 'git add -A'
  sh 'git commit -m "initial commit"'
end

task :build do
  sh 'rake commit'
  sh "gem build #{gem_name}.gemspec"
  sh "gem install #{gem_name}-#{gem_version}.gem"
end

task :origin do
  sh 'rake commit'
  sh "git remote add origin https://github.com/balmoral/#{gem_name}.git"
  sh 'git push -u origin master'
end

task :push_git do
  sh 'rake build'
  sh 'git push'
end

task :push_gem do
  sh 'rake push_git'
  sh "gem push #{gem_name}-#{gem_version}.gem"
end

task :irb do
  sh 'rake build'
  sh 'bundle exec irb'
end

task :pry do
  sh 'pry -r ./lib/cx/finance'
end