class DeviseTokenAuthChangeUsers < ActiveRecord::Migration[8.0]
  def change
    change_table(:users) do |t|
      ## Required
      # t.string :provider, null: false, default: "email"
      # t.string :uid, null: false, default: ""

      ## Recoverable
      t.boolean  :allow_password_change, default: true

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email

      ## Tokens
      t.json :tokens
    end

    # add_index :users, [:uid, :provider],     unique: true
    add_index :users, :confirmation_token,   unique: true
  end
end