OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1704902393109253", "7319e9c209578cf2e9a347cfa46d8b2e",
   :scope => 'email',
   :info_fields => 'email',
   provider_ignores_state: true
end