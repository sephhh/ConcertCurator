class Event < ActiveRecord::Base

  belongs_to :venue
  has_many :artist_events
  has_many :artists, through: :artist_events

  def pretty_date
    
    date = self.datetime_local.to_formatted_s(:long_ordinal)


    # time = Time.now                     # => Thu Jan 18 06:10:17 CST 2007

    # time.to_formatted_s(:time)          # => "06:10"
    # time.to_s(:time)                    # => "06:10"

    # time.to_formatted_s(:db)            # => "2007-01-18 06:10:17"
    # time.to_formatted_s(:number)        # => "20070118061017"
    # time.to_formatted_s(:short)         # => "18 Jan 06:10"
    # time.to_formatted_s(:long)          # => "January 18, 2007 06:10"
    # time.to_formatted_s(:long_ordinal)  # => "January 18th, 2007 06:10"
    # time.to_formatted_s(:rfc822)        # => "Thu, 18 Jan 2007 06:10:17 -0600"
  end



end
