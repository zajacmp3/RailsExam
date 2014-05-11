class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :name
      t.string :description
      t.string :image
      t.string :remote_image_url

      t.timestamps
    end
  end
end
