class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.references :kind, foreign_key: true
      t.blob :rmk

      t.timestamps
    end
  end
end
