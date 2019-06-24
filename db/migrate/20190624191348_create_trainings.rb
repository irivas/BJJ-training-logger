class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.datetime :date
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
