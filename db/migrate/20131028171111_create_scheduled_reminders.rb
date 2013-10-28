class CreateScheduledReminders < ActiveRecord::Migration
  def change
    create_table :scheduled_reminders do |t|
      t.string :title
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, index: true

      t.timestamps
    end
  end
end
