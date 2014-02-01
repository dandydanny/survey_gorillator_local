class CreatePossibleAnswers < ActiveRecord::Migration
  def change
  	create_table :possible_answers do |t|
  		t.string :text
  		t.integer :question_id 
  		t.timestamps 
  	end
  end
end
