class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.string :budget
      t.string :status

      t.timestamps
    end
  end
end
