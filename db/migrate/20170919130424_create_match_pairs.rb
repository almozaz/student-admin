class CreateMatchPairs < ActiveRecord::Migration[5.1]
  def change
    create_table :match_pairs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :match, index: true
      t.timestamps

    end

    add_foreign_key :match_pairs, :users, column: :match_id
  end
end
