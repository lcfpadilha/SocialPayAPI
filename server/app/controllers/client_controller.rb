class ClientController < ApplicationController
    def graph
        if current_client
            token = OAuth2::AccessToken.new(current_client, current_client.oauth_token)
            token.post('/me/feed', :message => "testing")
        else   
            redirect_to root_path
        end
    end
end
