require 'rails_helper'

RSpec.feature "User can edit an artist" do
  scenario "when they visit an artist's page" do
    new_artist_name = "Radiohead"
    new_image = "http://cdn.pitchfork.com/blog/1134/e6c3e81d.jpg"
    artist = Artist.create(name: "STRFKR", image_path:"http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist)
    click_on 'Edit'
    expect(current_path).to eq edit_artist_path(artist)
    fill_in "Name", with: new_artist_name
    fill_in "Image path", with: new_image
    click_on "Update Artist"

    expect(page).to have_content new_artist_name
    expect(page).to have_css("img[src=\"#{new_image}\"]")
  end
end


# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Edit"
# And I fill in a new name
# And I click on "Update Artist"
# Then I should see the artist's updated name
# Then I should see the existing image
