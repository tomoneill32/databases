feature 'viewing bookmarks' do
  scenario 'user can view bookmark' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.bbc.com"
    expect(page).to have_content "http://www.orangepippintrees.co.uk"  
  end
end
