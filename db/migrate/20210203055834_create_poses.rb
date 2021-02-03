class CreatePoses < ActiveRecord::Migration[6.0]
  def change
    create_table :poses do |t|

      t.timestamps
    end
  end
end
