class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.string :access_code
      t.integer :max_rating, default: nil
      t.integer :max_duration, default: nil
      t.string :genres
      t.string :services
      t.string :languages
      t.integer :format
      t.integer :movie_id, default: nil

      t.timestamps
    end
  end
end
