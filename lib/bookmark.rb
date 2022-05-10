require 'pg'

class Bookmark
  def self.all

    array = []
    
    con = PG.connect :dbname => 'bookmark_manager'
    
    rs = con.exec "SELECT url FROM bookmarks"

    rs.each do |row|
      array << row['url']
    end

    return array

  end
end
