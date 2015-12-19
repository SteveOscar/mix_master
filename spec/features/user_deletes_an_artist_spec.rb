RSpec.feature "User submits a new artist" do
  scenario "they see the page for the individual artists" do
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    @artist = Artist.create(name: "Bob Wayne", image_path: artist_image_path)
    @artist2 = Artist.create(name: "T Swift", image_path: "http://www.hercampus.com/sites/default/files/2015/10/20/taylor-swift_press-2013-650.jpg")

    visit artists_path
    click_on "#{@artist[:name]}"
    click_on "Delete"

    expect(page).should_not have_content "Bob Wayne"
  end
end


# When I visit that artist's show page
# And I click on "Delete"
# Then I should be back on the artist index page
# Then I should not see the artist's name
