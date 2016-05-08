class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :User
      t.string :name

      t.timestamps null: false
    end
  end
end
