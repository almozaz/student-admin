class CreateStudentLists < ActiveRecord::Migration[5.1]
  def change
    create_table :student_lists do |t|
      t.text :list

      t.timestamps
    end
  end
end
