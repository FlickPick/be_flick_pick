class CreateLikedMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :liked_movies do |t|
      t.references :temp_user, null: false, foreign_key: true
      t.integer :movie_id
      t.integer :round

      t.timestamps
    end
  end
end
