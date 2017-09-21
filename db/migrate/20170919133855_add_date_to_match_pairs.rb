class AddDateToMatchPairs < ActiveRecord::Migration[5.1]
  def change
    add_column :match_pairs, :date, :date, :default => Date.today
  end
end
