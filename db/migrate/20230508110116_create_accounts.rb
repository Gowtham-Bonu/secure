class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :cvv
      t.string :credit_card_number
      t.belongs_to :user

      t.timestamps
    end
  end
end
