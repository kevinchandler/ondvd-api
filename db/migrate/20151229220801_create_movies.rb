class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :movie_id
      t.string :movie_name
      t.references :user
      t.boolean :user_notified, default: false
      t.date :expected_release
      t.date :actual_release

      t.timestamps null: false
    end
  end
end
