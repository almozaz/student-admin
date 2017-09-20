class AddIndexToMatchPair < ActiveRecord::Migration[5.1]
  def change
    add_column :match_pairs, :index, :integer
  end
end
