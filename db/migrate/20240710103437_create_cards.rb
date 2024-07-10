class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.belongs_to :deck, index: true, foreign_key: true
      t.string :front_side
      t.string :back_side
      t.string :image

      t.timestamps
    end
  end
end
