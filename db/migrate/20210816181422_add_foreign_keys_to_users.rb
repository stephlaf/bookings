class AddForeignKeysToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :renter, null: false, foreign_key: {to_table: :users}
  end
end
