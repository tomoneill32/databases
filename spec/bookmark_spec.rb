require 'bookmark'

describe Bookmark do
  describe '#.all' do
    it 'returns a list of bookmarks' do
      insert_bookmarks
      bookmarks = Bookmark.all
      bookmarks = bookmarks.map { |bookmark| bookmark.url}
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("https://www.bbc.co.uk")
    end
  end

  describe '#.create' do
    it 'adds a bookmark to the list' do
      bookmark = Bookmark.create("website", "title")
      bookmarks = Bookmark.all.map { |bookmark| { url: bookmark.url, title: bookmark.title } }
      expect(bookmarks).to include({url: "website", title: "title"})
    end
  end

  describe '#.delete' do
    it 'deletes a bookmark from the list' do
      insert_bookmarks
      bookmarks = Bookmark.all
      id = bookmarks[2].id
      Bookmark.delete(id)
      bookmarks = Bookmark.all.map { |bookmark| bookmark.url }
      expect(bookmarks).not_to include("http://www.destroyallsoftware.com")
    end
  end
end
