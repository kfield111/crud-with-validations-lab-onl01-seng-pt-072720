class Song < ApplicationRecord

    validates :title, presence: true 
    validates :title, uniqueness: { scope: [:release_year, :artist_name]}
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}, if: :released?
    validates :artist_name, presence: true


    def release_year_exists
        if self.released
            unless self.release_year
                "error"
            else
                date = Time.new
                if date.year < self.release_year
                "error2"
                end
            end
        end
    end



end
