class Band < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  before_create :generate_slug

  def generate_slug
    self.slug = name.downcase.gsub(' ', '-')
  end

  def albums
    response = HTTParty.get("https://theaudiodb.com/api/v1/json/2/discography.php?s=#{name}")
    @albums ||= response['album'].map{ |album| album['strAlbum'] }
    @albums
  end
end
