class CreatePoses < ActiveRecord::Migration[6.0]
  def change
    create_table :poses do |t|
      t.string     :title,          null: false 
      t.integer    :effect_id,      null: false
      t.integer    :minute,         null: false
      t.integer    :intensity_id,   null: false
      t.references :user,           null: false , foreign_key: true
      t.timestamps
    end
  end
end
