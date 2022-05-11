feature 'adding bookmarks' do
  scenario 'user can add bookmarks to the bookmark list' do
    visit('/bookmarks')
    fill_in 'url', with: "www.google.co.uk"
    fill_in 'title', with: "Google"
    click_on 'Add'
    expect(page).to have_link 'Google', href: "www.google.co.uk"
  end
end
