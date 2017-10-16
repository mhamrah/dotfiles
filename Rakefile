ENV['HOMEBREW_CASK_OPTS'] = "--appdir=/Applications"

def filemap(map)
  map.inject({}) do |result, (key, value)|
    result[File.expand_path(key)] = File.expand_path(value)
    result
  end.freeze
end

LINKED_FILES = filemap(
  'zshrc' => '~/.zshrc',
  'gitconfig' => '~/.gitconfig',
  'gemrc' => '~/.gemrc',
  'nvim/init.vm' => '~/.config/nvim/init.vim',
  'nvim/nvimrc.local' => '~/.config/nvimrc.local',
  'nvim/nvimrc.local.bundles' => '~/.config/nvimrc.local.bundles',
  'bash_profile' => '~/.bash_profile',
  'ctags' => '~/.ctags',
  'agignore' => '~/.agignore',
  'tmux.conf'     => '~/.tmux.conf'
)


BREW_APPS = [
  "hub",
  "rocksdb",
  "go",
  "docker",
  "reattach-to-user-namespace",
  "ctags",
  "the_silver_searcher",
  "jq",
  "zsh",
  "fasd",
  "neovim",
  "getantibody/tap/antibody"
]

BREW_CASK_APPS = [
  "alfred",
  "sizeup",
  "caffeine",
  "1password",
  "visual-studio-code"
]

GO_TOOLS = [
  "go get github.com/onsi/ginkgo/ginkgo",
  "go get golang.org/x/tools/cover"
]
#cleanmymac, camtasia, grandperspective, macpaw gemini


def brew_install(package, *args)
  versions = `brew list #{package} --versions`
  options = args.last.is_a?(Hash) ? args.pop : {}

  # if brew exits with error we install tmux
  if versions.empty?
    sh "brew install #{package} #{args.join ' '}"
  elsif options[:requires]
    # brew did not error out, verify tmux is greater than 1.8
    # e.g. brew_tmux_query = 'tmux 1.9a'
    installed_version = versions.split(/\n/).first.split(' ')[1]
    unless version_match?(options[:version], installed_version)
      sh "brew upgrade #{package} #{args.join ' '}"
    end
  end
end

def version_match?(requirement, version)
  # This is a hack, but it lets us avoid a gem dep for version checking.
  Gem::Dependency.new('', requirement).match?('', version)
end

def install_github_bundle(user, package)
  unless File.exist? File.expand_path("~/.vim/bundle/#{package}")
    sh "git clone https://github.com/#{user}/#{package} ~/.vim/bundle/#{package}"
  end
end

def brew_cask_install(package, *options)
  output = `brew cask info #{package}`
  return unless output.include?('Not installed')

  sh "brew cask install #{package} #{options.join ' '}"
end

def step(description)
  description = "-- #{description} "
  description = description.ljust(80, '-')
  puts
  puts "\e[32m#{description}\e[0m"
end

def app_path(name)
  path = "/Applications/#{name}.app"
  ["~#{path}", path].each do |full_path|
    return full_path if File.directory?(full_path)
  end

  return nil
end

def app?(name)
  return !app_path(name).nil?
end

def get_backup_path(path)
  number = 1
  backup_path = "#{path}.bak"
  loop do
    if number > 1
      backup_path = "#{backup_path}#{number}"
    end
    if File.exists?(backup_path) || File.symlink?(backup_path)
      number += 1
      next
    end
    break
  end
  backup_path
end

def link_file(original_filename, symlink_filename)
  original_path = File.expand_path(original_filename)
  symlink_path = File.expand_path(symlink_filename)
  if File.exists?(symlink_path) || File.symlink?(symlink_path)
    if File.symlink?(symlink_path)
      symlink_points_to_path = File.readlink(symlink_path)
      return if symlink_points_to_path == original_path
      # Symlinks can't just be moved like regular files. Recreate old one, and
      # remove it.
      ln_s symlink_points_to_path, get_backup_path(symlink_path), :verbose => true
      rm symlink_path
    else
      # Never move user's files without creating backups first
      mv symlink_path, get_backup_path(symlink_path), :verbose => true
    end
  end
  ln_s original_path, symlink_path, :verbose => true
end

def unlink_file(original_filename, symlink_filename)
  original_path = File.expand_path(original_filename)
  symlink_path = File.expand_path(symlink_filename)
  if File.symlink?(symlink_path)
    symlink_points_to_path = File.readlink(symlink_path)
    if symlink_points_to_path == original_path
      # the symlink is installed, so we should uninstall it
      rm_f symlink_path, :verbose => true
      backups = Dir["#{symlink_path}*.bak"]
      case backups.size
      when 0
        # nothing to do
      when 1
        mv backups.first, symlink_path, :verbose => true
      else
        $stderr.puts "found #{backups.size} backups for #{symlink_path}, please restore the one you want."
      end
    else
      $stderr.puts "#{symlink_path} does not point to #{original_path}, skipping."
    end
  else
    $stderr.puts "#{symlink_path} is not a symlink, skipping."
  end
end

namespace :install do
  desc 'Make common folders'
  task :init do
    sh 'mkdir -p ~/.config/nvim'
    sh 'mkdir -p ~/dev/go'
    sh 'touch ~/.hushlogin'
    sh 'ln -s ~/Dropbox/ssh ~/.ssh'
  end

  desc 'Update or Install Brew'
  task :brew do
    step 'Homebrew'
    unless system('which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
      raise "Homebrew must be installed before continuing."
    end
  end

  desc 'Custom install apps'
  task :apps do
    BREW_CASK_APPS.each do |app|
      step app
      brew_cask_install app
    end
  end

  desc 'Install iTerm'
  task :iterm do
    step 'iterm2'
    unless app? 'iTerm'
      brew_cask_install 'iterm2'
    end
  end

  desc 'Install brew apps'
  task :brew_apps do
    BREW_APPS.each do |app|
      step app
      brew_install app
    end
  end

  desc 'Install go tools'
  task :gotools do
    step 'gotools'
    GO_TOOLS.each do |tool|
      step tool
      sh tool
    end
  end
end

desc 'Install these config files.'
task :install do
  Rake::Task['install:init'].invoke
  Rake::Task['install:brew'].invoke
  Rake::Task['install:iterm'].invoke
  Rake::Task['install:brew_apps'].invoke
  Rake::Task['install:apps'].invoke
  Rake::Task['link'].invoke

end

desc 'Link Files'
task :link do
  step 'symlink'
  
    LINKED_FILES.each do |orig, link|
      link_file orig, link
    end
end

desc 'Uninstall these config files.'
task :uninstall do
  step 'un-symlink'

  # un-symlink files that still point to the installed locations
  LINKED_FILES.each do |orig, link|
    unlink_file orig, link
  end

end

task :default => :install


