class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :director
      t.integer :length_in_sec
      t.string :language
      t.timestamps
    end
  end
end
