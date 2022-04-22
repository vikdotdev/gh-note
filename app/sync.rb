require 'fileutils'
require_relative 'gist'

class Sync
  attr_reader :gists

  def initialize(gists)
    @gists = gists
  end

  def fetch!
    ensure_folder_exists

    threads = []
    gists.each do |gist|
      threads << Thread.new do
        gist.clone!
      rescue Git::GitExecuteError
        gist.pull!
      end
    end

    threads.each(&:join)
    puts 'Fetch and pull finished.'
  end

  # TODO: keep for that push --all option
  # def push!
  #   threads = []
  #   gists.each do |gist|
  #     threads << Thread.new do
  #       gist.push!
  #     rescue Git::GitExecuteError => e
  #       puts e
  #     end
  #   end
  #
  #   threads.each(&:join)
  #   puts 'Push finished.'
  # end

  def ensure_folder_exists
    FileUtils.mkdir_p(Config.path)
  end
end
