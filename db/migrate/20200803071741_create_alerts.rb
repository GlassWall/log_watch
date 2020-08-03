class CreateAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.string :alert_type
      t.integer :frequency
      t.integer :duration
      t.integer :wait_time

      t.timestamps
    end
  end
end
