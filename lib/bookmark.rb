require 'pg'

class Bookmark
  def self.all

    array = []
    
    # con = PG.connect :dbname => 'bookmark_manager'

    #  VVVVV this is added for step 9
    con = PG.connect :dbname => 'bookmark_manager_test'
    
    rs = con.exec "SELECT url FROM bookmarks"

    rs.each do |row|
      array << row['url']
    end

    return array

  end
end
