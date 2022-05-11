feature 'adding bookmarks' do
  scenario 'user can add bookmarks to the bookmark list' do
    visit('/bookmarks')
    fill_in 'url', with: "www.google.co.uk"
    click_on 'Add'
    expect(page).to have_content("www.google.co.uk")
  end
end
