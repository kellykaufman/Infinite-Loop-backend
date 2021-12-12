class AddsUserIdToAnxiety < ActiveRecord::Migration[6.1]
  def change
    add_column :anxieties, :user_id, :integer
  end
end
