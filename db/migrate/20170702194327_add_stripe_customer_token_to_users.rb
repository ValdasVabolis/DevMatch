class AddStripeCustomerTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    # This file was generated using command: `rails g migration AddStripeCustomerTokenToUsersRunning`
    # Add column to users table, make column name stripe_customer_token, make the column string
    # Migration of db is executed by this command: `rails db:migrate`
    add_column :users, :stripe_customer_token, :string
  end
end
