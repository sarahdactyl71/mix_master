require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they press the delete button" do
    artist = Artist.create(name: "STRFKR", image_path:"http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")

    visit artist_path(artist)
    click_on "Delete"
    expect(current_path).to eq artists_path
    expect(page).to_not have_content artist.name
  end
end

# As a user
# Given that an artist exists in the database
# When I visit that artist's show page
# And I click on "Delete"
# Then I should be back on the artist index page
# Then I should not see the artist's name
