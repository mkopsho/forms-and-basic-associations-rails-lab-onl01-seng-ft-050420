class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil # If self.artist is exists, #artist_name = self.artist.name, else #artist_name = nil
  end

  def notes=(notes)
    notes.each do |content|
      note = Note.create(content: content)
      self.notes << note
    end
  end
end
