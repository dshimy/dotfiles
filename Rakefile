task :default => [:install]

desc "Install dotfiles"
task :install do
  puts "Installing dotfiles..."
  IGNORE_FILES = %w(.git Rakefile README.md)
  Dir['*'].each do |file|
    if !IGNORE_FILES.include?(file)
      puts "  linking #{file}"
      system "ln -sf $PWD/#{file} $HOME/.#{file}"      
    end
  end
end
