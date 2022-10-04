class CreateDanceClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :dance_classes do |t|
      t.string :category
      t.string :location
      t.date :date
      t.string :starts_at
      t.string :ends_at
      t.integer :duration
    end
  end
end
