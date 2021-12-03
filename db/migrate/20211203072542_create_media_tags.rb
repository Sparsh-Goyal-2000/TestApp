class CreateMediaTags < ActiveRecord::Migration[6.1]
  def change
    create_table :media_tags do |t|
      t.references :tag
      t.references :taggable, polymorphic: true
      t.timestamps
    end
  end
end
