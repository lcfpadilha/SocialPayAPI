class AddOauthfieldsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :oauth_token, :string
    add_column :clients, :outh_experes_at, :datetime
  end
end
