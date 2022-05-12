feature 'updating bookmarks' do
  scenario 'user can update a bookmark from the bookmark list' do
    insert_bookmarks
    visit('/bookmarks')
    select 'Makers', from: 'bookmark_to_update'
    click_on 'Update'

    fill_in 'url', with: "http://www.reddit.com"
    fill_in 'title', with: "Reddit"
    click_on 'Submit'

    expect(page).to have_link 'Reddit', href: "http://www.reddit.com"
    expect(page).to have_no_link 'Makers', href: "http://www.makersacademy.com"
  end
end