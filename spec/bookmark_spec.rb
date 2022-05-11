require 'bookmark'

describe Bookmark do
  describe '#.all' do
    it 'returns a list of bookmarks' do
      insert_bookmarks
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("https://www.bbc.co.uk")
    end
  end

  describe '#.create' do
    it 'adds a bookmark to the list' do
      bookmark = Bookmark.create("website")
      expect(Bookmark.all).to include("website")
    end
  end

end

# Test drive a refactor of the code to use a Model, that returns the list of bookmarks.
# You'll probably want to create a Bookmark model that responds to the class method .all with a hard-coded array of Bookmark instances.
