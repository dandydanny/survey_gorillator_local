class PossibleAnswer < ActiveRecord::Base
  belongs_to :question 
  has_many :chosen_answers 
end 
 
