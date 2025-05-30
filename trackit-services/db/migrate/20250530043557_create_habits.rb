class CreateHabits < ActiveRecord::Migration[7.1]
  def change
    create_table :habits do |t|
      t.string :name
      t.boolean :done_today
      t.jsonb :completed_dates

      t.timestamps
    end
  end
end
