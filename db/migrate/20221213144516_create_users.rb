class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid  do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: { unique: true, name: 'unique_emails' }
      t.string :password_digest
      t.timestamps
    end
  end
end
