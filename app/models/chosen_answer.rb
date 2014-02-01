class ChosenAnswer < ActiveRecord::Base
	belongs_to :possible_answer
	belongs_to :question 
	belongs_to :user
end
