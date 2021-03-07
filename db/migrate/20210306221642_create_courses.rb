class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses, id: :uuid do |t|
      t.string :title
      t.text :content
      t.uuid :level_id
      t.uuid :material_id
      t.string :author
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :slug

      t.timestamps
    end
  end
end
