class Movie < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates_uniqueness_of :movie_id, { scope: :user_id }

end
