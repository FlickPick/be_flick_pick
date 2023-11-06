class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.string :access_code
      t.string :max_rating
      t.integer :max_duration
      t.string :genres
      t.string :services
      t.integer :movie_id, default: 0

      t.timestamps
    end
  end
end
