class CreateSliders < ActiveRecord::Migration[5.0]
  def change
    create_table :sliders do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
