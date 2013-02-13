class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :country
      t.integer :vat_number
      t.string :gender
      t.date :birth_date

      t.timestamps
    end
  end
end
