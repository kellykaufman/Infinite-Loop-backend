class CreateAnxieties < ActiveRecord::Migration[6.1]
  def change
    create_table :anxieties do |t|
      t.string :life_theme
      t.string :intrusive_thought_or_feeling
      t.string :anxiety_theme
      t.string :opposite_action
      t.integer :timer
      t.string :progress

      t.timestamps
    end
  end
end
