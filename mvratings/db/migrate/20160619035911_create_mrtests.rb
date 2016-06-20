class CreateMrtests < ActiveRecord::Migration
  def change
    create_table :mrtests do |t|
      t.string :first

      t.timestamps null: false
    end
  end
end
