class CreateDecks < ActiveRecord::Migration[7.1]
  def change
    create_table :decks do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.string :cards

      t.timestamps
    end
  end
end
