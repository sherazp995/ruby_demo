class CreateStiComments < ActiveRecord::Migration[7.0]
  def change
    create_table :sti_comments do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
