class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.references :user, index: true, foreign_key: true
      t.references :match, index: true
      t.timestamps 
    end

    add_foreign_key :matches, :users, column: :match_id
  end
end
