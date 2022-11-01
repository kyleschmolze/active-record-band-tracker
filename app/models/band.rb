class Band < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :gigs
  has_many :venues, through: :gigs

  before_create :generate_slug

  def generate_slug
    self.slug = name.downcase.gsub(' ', '-')
  end

  def serialize
    {
      name: name,
      genre: genre,
      slug: slug,
      albums: albums,
      gigs: gigs,
      venues: venues,
    }
  end

  def albums
    response = HTTParty.get("https://theaudiodb.com/api/v1/json/2/discography.php?s=#{name}")
    @albums ||= response['album'].map{ |album| album['strAlbum'] }
    @albums
  end
end
