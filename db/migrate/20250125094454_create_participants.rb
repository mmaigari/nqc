class CreateParticipants < ActiveRecord::Migration[8.0]
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :middle_name
      t.string :surname
      t.string :gender
      t.string :marital_status
      t.date :date_of_birth
      t.string :state
      t.string :lga
      t.string :ward
      t.string :email_address, unique: true
      t.string :phone_number, unique: true
      t.integer :year_of_musabaqa
      t.text :home_address
      t.string :bank_name
      t.string :account_name
      t.string :account_number
      t.string :full_name
      t.string :ticket_type, default: 'Hafiz Quran'
      t.timestamps
    end
  end
end
