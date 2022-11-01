class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.references :band, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
