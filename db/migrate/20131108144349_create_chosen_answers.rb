class CreateChosenAnswers < ActiveRecord::Migration
  def change
  	create_table :chosen_answers do |t|
  		t.integer :question_id 
  		t.integer :user_id 
  		t.integer :possible_answer_id
  		t.timestamps  
  	end
  end
end
