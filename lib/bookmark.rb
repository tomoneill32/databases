require 'pg'

class Bookmark

  attr_reader :id, :url, :title

  def initialize(id, url, title)

    @id = id
    @url = url
    @title = title

  end

  def self.all

    array = []

    if ENV['RACK_ENV'] == 'test'
    
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end    
    rs = con.exec "SELECT * FROM bookmarks"
    rs.each do |row|
      # p row
      array << Bookmark.new(row['id'], row['url'], row['title'])
    end
    return array
  end

  def self.create(website, title)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    
    con.exec "INSERT INTO bookmarks(url, title) VALUES ('#{website}', '#{title}')"
  end

end
