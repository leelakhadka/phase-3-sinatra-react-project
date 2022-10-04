class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.integer :fee
      t.boolean :paid
      t.integer :student_id
      t.integer :dance_class_id
    end
  end
end
