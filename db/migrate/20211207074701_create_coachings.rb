class CreateCoachings < ActiveRecord::Migration[6.1]
  def change
    create_table :coachings do |t|
      t.references :branch
      t.references :sport
      t.string :head_coach
      t.timestamps
    end
  end
end
