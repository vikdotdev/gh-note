class Editor
  EDITOR = ENV['EDITOR']

  attr_reader :gist

  def initialize(gist)
    @gist = gist
  end

  def launch(push_after_exit: true)
    system("cd #{cwd}; #{EDITOR} .")
    gist.push! if push_after_exit
  end

  private

  def cwd
    File.join(Config.path, gist.id)
  end
end
