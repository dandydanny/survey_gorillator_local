class Question < ActiveRecord::Base
  belongs_to :survey 
  has_many :possible_answers
  has_many :chosen_answers 
end
