require 'tty-prompt'
require_relative './config'

class Search
  attr_reader :prompt, :list

  def initialize(list)
    @list = list
    @prompt = TTY::Prompt.new
  end

  def search(label = '')
    prompt.select(label, list, filter: true, per_page: 20)
  rescue Interrupt
    puts
    exit 130
  end
end
