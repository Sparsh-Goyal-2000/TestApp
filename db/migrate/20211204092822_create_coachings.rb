class CreateCoachings < ActiveRecord::Migration[6.1]
  def change
    create_table :coachings do |t|
      t.string :head_name
      t.string :sports_type
      t.timestamps
    end
  end
end
