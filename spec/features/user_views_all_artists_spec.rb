require 'rails_helper'


RSpec.feature "User views all artists" do
  scenario "they see an individual artist page" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    Artist.create(name: "Bob Wayne", image_path: artist_image_path)

    visit artists_path

    expect(page).to have_content "Bob Wayne"

    click_on "Bob Wayne"

    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end

# When I visit the artists index
# Then I should see each artist's name
# And each name should link to that artist's individual page

end
