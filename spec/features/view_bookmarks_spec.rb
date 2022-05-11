feature 'viewing bookmarks' do
  scenario 'user can view bookmark' do
    insert_bookmarks
    visit('/bookmarks')
    expect(page).to have_content "Makers"
  end
end
