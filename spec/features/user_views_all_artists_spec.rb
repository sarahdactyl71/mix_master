require 'rails_helper'

RSpec.feature "User can view all artists" do
  scenario "when they visit a page to see all artists" do
    Artist.create(name: "Bob Marley", image_path:"yus")
    artist = Artist.create(name: "STRFKR", image_path:"http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg")
    Artist.create(name: "Radiohead", image_path:"yus")
    artist_name_1       = "Bob Marley"
    artist_name_2       = "STRFKR"
    artist_name_3      = "Radiohead"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit '/artists'

    expect(page).to have_content artist_name_1
    expect(page).to have_content artist_name_2
    expect(page).to have_content artist_name_3

    click_on "STRFKR"

    expect(page).to have_current_path("/artists/#{artist.id}")

# As a user
# Given that artists exist in the database
# When I visit the artists index
# Then I should see each artist's name
# And each name should link to that artist's individual page
  end
end
