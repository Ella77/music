class AddHrefToRanks < ActiveRecord::Migration[5.2]
  def change
    add_column :ranks, :href, :string
  end
end
