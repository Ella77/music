class AddScoreToRanks < ActiveRecord::Migration[5.2]
  def change
    add_column :ranks, :score, :integer
  end
end
