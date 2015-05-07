class Event < ActiveRecord::Base

  belongs_to :venue
  has_many :artist_events
  has_many :artists, through: :artist_events



  # Event.all [event1, event2]

  # Event.split [[week1events[day1events][day2events]], [week2events[]] ]

  # {week1 =>
  #     {
  #       day1 => [event1, event2],
  #       day2 => [event1, event2],
  #     } 

  # week2

  #     { 
  #       day1 => [event1, event2],
  #       day2 => [event1, event2],

  #     }
  # }
#   time.now + a week
#   find all shows in this range
#   find them time.now+a week to that + another week
# Figure out calendar week
# look up shows in this week
  # def self.
  # end


  def pretty_date
    
    self.datetime_local.to_formatted_s(:long_ordinal)
    # self.datetime_local.strftime("%A, %d %b %Y %l:%M %p")

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

  def week
    self.datetime_local.strftime('%W')
  end
  def day
    self.datetime_local.strftime('%d')
  end


end
