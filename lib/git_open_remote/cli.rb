module GitOpenRemote
  class CLI
    include Commander::Methods

    def run
      program :name, 'git-open-remote'
      program :version, GitOpenRemote::VERSION
      program :description, 'Open your git remote in browser'

      command :open do |cmd|
        cmd.syntax = 'open origin'
        cmd.description = 'Open remote url in browser'
        cmd.action do |args, _|
          git = Git.open(Dir.pwd)
          url = git.remote(args[0]).url
          return say "Looks like #{name} doesn't exist ;(" unless url

          Launchy.open(parse_url(url))
        end
      end

      default_command :open
      run!
    end

    private

    def parse_url(url)
      uri = begin
        URI.parse(url)
      rescue URI::InvalidURIError
        URI::SshGit.parse(url)
      end

      "#{uri.host}/#{uri.path.sub(/\.git$/, '')}"
    end
  end
end
