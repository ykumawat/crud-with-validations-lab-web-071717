class Song < ActiveRecord::Base

#define the validations

# title, a string
  # Must not be blank
  # Cannot be repeated by the same artist in the same year
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
# released, a boolean describing whether the song was ever officially released.
  # Must be true or false

  #validates :released

# release_year, an integer
  # Optional if released is false
  # Must not be blank if released is true
  # Must be less than or equal to the current year

  validate :release_year_valid?

# artist_name, a string
  # Must not be blank

  def release_year_valid?
    if (self.released && self.release_year) && (self.release_year > Date.today.year)
      errors.add(:release_year, "The release year is invalid")
    elsif self.released && self.release_year.nil?
      errors.add(:release_year, "The release year is invalid")
    end
  end


end
