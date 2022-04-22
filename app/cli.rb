class CLI < Thor
  desc 'view', 'View selected gist'
  def view
    gists = Gist.all
    gist = Search.new(gists).search
    View.new(gist).render
  end

  desc 'create', 'Create an empty gist and open EDITOR. Then push on exit'
  def create
    gist = Gist.create!
    Editor.new(gist).launch
  end

  desc 'edit', 'Edit selected gist locally'
  def edit
    gists = Gist.all
    gist = Search.new(gists).search
    Editor.new(gist).launch
  end

  desc 'sync', 'Clone & pull remote gists'
  def sync
    gists = Gist.all
    Sync.new(gists).fetch!
  end

  desc 'push', 'Push local changes'
  def push
    gists = Gist.all
    gist = Search.new(gists).search
    gist.push!
  end
end
