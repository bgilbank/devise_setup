class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :titletag
      t.string :meta
      t.string :tile
      t.string :slug
      t.text :body

      t.timestamps
    end
  end
end
