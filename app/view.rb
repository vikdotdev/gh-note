
class View
  attr_reader :gist

  def initialize(gist)
    @gist = gist
  end

  def render
    system("gh gist view #{gist.id}")
  end
end
