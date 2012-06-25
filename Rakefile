desc "Install dotfiles"
task :install do
  puts "Installing dotfiles..."
  IGNORE_FILES = %w(Rakefile README.md)
  Dir['*'].each do |file|
    if !IGNORE_FILES.include?(file)
      puts "  linking #{file}"
      system "ln -sf #{file} ~/.#{file}"      
    end
  end
end