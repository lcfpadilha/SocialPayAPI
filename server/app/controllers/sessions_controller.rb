class SessionsController < ApplicationController
  def create
    client = Client.find_by_uid(env["omniauth.auth"].uid)
    if client == nil
      client = Client.new
      unless client.from_omniauth(env["omniauth.auth"])
        puts "Erro de autenticacao"
      end
    end
    cookies[:client_id] = client.id
    redirect_to '/pay/card_register'
  end

  def destroy
    reset_session
    cookies.clear
    redirect_to root_url
  end
end