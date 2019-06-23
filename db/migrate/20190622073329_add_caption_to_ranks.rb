class AddCaptionToRanks < ActiveRecord::Migration[5.2]
  def change
    add_column :ranks, :caption, :string
  end
end
