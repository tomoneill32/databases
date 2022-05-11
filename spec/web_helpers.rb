require 'pg'

def empty_bookmarks_test
  
  con = PG.connect :dbname => 'bookmark_manager_test'

  con.exec "TRUNCATE bookmarks"

end

def insert_bookmarks
  con = PG.connect :dbname => 'bookmark_manager_test'

  con.exec "INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers'), ('https://www.bbc.co.uk', 'BBC'), ('http://www.destroyallsoftware.com', 'Destroy')"

end