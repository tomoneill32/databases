require 'pg'

class Bookmark
  def self.all

    array = []

    if ENV['RACK_ENV'] == 'test'
    
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end    
    rs = con.exec "SELECT url FROM bookmarks"
    rs.each do |row|
      array << row['url']
    end
    return array
  end

  def self.create(website)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    
    con.exec "INSERT INTO bookmarks(url) VALUES ('#{website}')"
  end

end
