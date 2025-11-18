class CreateVideoGenerations < ActiveRecord::Migration[7.1]
  def change
    create_table :video_generations do |t|
      t.references :lesson, null: false, foreign_key: true
      t.string :external_id
      t.string :status
      t.string :provider
      t.string :result_url

      t.timestamps
    end
  end
end
