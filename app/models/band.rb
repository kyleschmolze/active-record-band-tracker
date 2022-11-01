class Band < ApplicationRecord
  # TODO Add validation on the :name attribute for presence and uniqueness

  # TODO write a method called :generate_slug which assigns self.slug using the band's name,
  # then attach a before_create callback to call this method anytime a Band is created

  # TODO write the band.albums API method!
  def albums
    # use HTTParty to make a GET request to the albums API at
    # https://theaudiodb.com/api/v1/json/2/discography.php?s=NAME_OF_BAND
    # response = HTTParty.get("a_full_url_here")
    # binding.pry and check out response to see what you got back!
  end
end
