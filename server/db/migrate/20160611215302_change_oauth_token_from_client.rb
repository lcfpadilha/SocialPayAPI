class ChangeOauthTokenFromClient < ActiveRecord::Migration
  def change
    rename_column :clients, :outh_experes_at, :oauth_expires_at
  end
end
