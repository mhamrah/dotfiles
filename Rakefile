ENV['HOMEBREW_CASK_OPTS'] = "--appdir=/Applications"

BREW_APPS = [
  "awscli",
  "hub",
  "node",
  "giter8",
  "rocksdb",
  "go",
  "docker",
  "fleetctl",
  "postgres",
  "sbt",
  "reattach-to-user-namespace",
  "ctags",
  "the_silver_searcher",
  "vim",
  "jq",
  "ansible",
  "git-extras",
  "zsh",
  "fasd"
]

BREW_CASK_APPS = [
  "github",
  "cyberduck",
  "dash",
  "spotify",
  "parallels-desktop",
  "google-cloud-sdk",
  "google-chrome",
  "dropbox",
  "google-drive",
  "alfred",
  "vagrant",
  "virtualbox",
  "java",
  "packer",
  "sizeup",
  "evernote",
  "handbrake",
  "cloudup",
  "spotify",
  "caffeine",
  "atom",
  "launchrocket",
  "1password"
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

def prezto_install
  sh "git clone --recursive https://github.com/sorin-ionescu/prezto.git \"${ZDOTDIR:-$HOME}/.zprezto\""
  #todo rm runcoms, symlink to prezto
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
  desc 'Update or Install Brew'
  task :brew do
    step 'Homebrew'
    unless system('which brew > /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
      raise "Homebrew must be installed before continuing."
    end
  end

  desc 'Install Homebrew Cask'
  task :brew_cask do
    step 'Homebrew Cask'

    brew_install 'caskroom/cask/brew-cask'
  end

  desc 'Install github hub'
  task :hub do
    step 'hub'
    sh "gem install hub"
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

  desc 'Install tmux'
  task :tmux do
    step 'tmux'
    # tmux copy-pipe function needs tmux >= 1.8
    brew_install 'tmux', :requires => '>= 1.8'
  end

  desc 'Install Vundle'
  task :vundle do
    step 'vundle'
    install_github_bundle 'gmarik','vundle'
    sh 'vim -c "BundleInstall" -c "q" -c "q"'
  end

  desc 'Intall prezto'
  task :prezto do
    step 'prezto'
    prezto_install
    sh 'setopt EXTENDED_GLOB;
        for rcfile in ~/.dotfiles/prezto/^README.md(.N); do
          ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
        done'
  end
end

def filemap(map)
  map.inject({}) do |result, (key, value)|
    result[File.expand_path(key)] = File.expand_path(value)
    result
  end.freeze
end
desc 'Install these config files.'
task :install do
  Rake::Task['install:brew'].invoke
  Rake::Task['install:brew_cask'].invoke
  Rake::Task['install:iterm'].invoke
  Rake::Task['install:brew_apps'].invoke
  Rake::Task['install:tmux'].invoke
  Rake::Task['install:apps'].invoke
  Rake::Task['install:prezto'].invoke

  # TODO install gem ctags?
  # TODO run gem ctags?

  step 'symlink'

  LINKED_FILES.each do |orig, link|
    link_file orig, link
  end

  # Install Vundle and bundles
  Rake::Task['install:vundle'].invoke

  step 'iterm2 profiles'
  puts
  puts "  Your turn!"
  puts
  puts "  Go and manually set up Solarized Light and Dark profiles in iTerm2."
  puts "  (You can do this in 'Preferences' -> 'Profiles' by adding a new profile,"
  puts "  then clicking the 'Colors' tab, 'Load Presets...' and choosing a Solarized option.)"
  puts "  Also be sure to set Terminal Type to 'xterm-256color' in the 'Terminal' tab."
  puts
  puts "  Enjoy!"
  puts
end

namespace :install do
  desc "install on a linux machine"
  task :linux do
   LINKED_FILES.each do |orig, link|
    link_file orig, link
   end

   Rake::Task['install:vundle'].invoke
  end
end

desc 'Uninstall these config files.'
task :uninstall do
  step 'un-symlink'

  # un-symlink files that still point to the installed locations
  LINKED_FILES.each do |orig, link|
    unlink_file orig, link
  end

  step 'homebrew'
  puts
  puts 'Manually uninstall homebrew if you wish: https://gist.github.com/mxcl/1173223.'

  step 'iterm2'
  puts
  puts 'Run this to uninstall iTerm:'
  puts
  puts '  rm -rf /Applications/iTerm.app'

end

task :default => :install

LINKED_FILES = filemap(
  'vim'           => '~/.vim',
  'tmux.conf'     => '~/.tmux.conf',
  'tmux-osx.conf'     => '~/.tmux-osx.conf',
  'vimrc'         => '~/.vimrc',
  'vimrc.bundles' => '~/.vimrc.bundles',
  'bash_profile' => '~/.bash_profile',
  'bash' => '~/.bash',
  'ctags' => '~/.ctags',
  'gitconfig' => '~/.gitconfig',
  'sbtopts' => '/usr/local/etc/sbtopts',
  'gemrc' => '~/.gemrc',
  'zshrc' => '~/.zshrc',
  '~/gd/Trunk/sbt' => '~/.sbt'
)


