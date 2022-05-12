feature 'deleting bookmarks' do
  scenario 'user can delete bookmarks from the bookmark list' do
    insert_bookmarks
    visit('/bookmarks')
    select 'Makers', from: 'bookmark_to_delete'
    click_on 'Delete'
    expect(page).to have_no_link 'Makers', href: "http://www.makersacademy.com"
    expect(page).to have_link 'BBC', href: "https://www.bbc.co.uk"
  end
end
