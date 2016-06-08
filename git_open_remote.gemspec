lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'git_open_remote/version'

Gem::Specification.new do |spec|
  spec.name = 'git_open_remote'
  spec.version = GitOpenRemote::VERSION
  spec.author = 'Alexander Tipugin'
  spec.summary = 'Open your git remote in browser'

  spec.files = `git ls-files -z`.split("\x0")
  spec.bindir = 'exe'
  spec.executables = Dir["#{spec.bindir}/*"].map { |f| File.basename(f) }

  spec.add_dependency 'commander', '~> 4.4'
  spec.add_dependency 'git', '~> 1.3'
  spec.add_dependency 'uri-ssh_git', '~> 2.0'
  spec.add_dependency 'launchy', '~> 2.4'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
end
