class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.string :access_code
      t.integer :max_rating, default: -1
      t.integer :max_duration, default: -1
      t.string :genres
      t.string :services
      t.string :languages
      t.integer :format
      t.integer :movie_id, default: 0

      t.timestamps
    end
  end
end
