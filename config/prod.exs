import Config

# Do not print debug messages in production
config :logger, level: :warn

config :rollbax,
  environment: to_string(Mix.env()),
  enabled: true,
  enable_crash_reports: true

##
# NervesHub API
#
config :nerves_hub_api, NervesHubAPIWeb.Endpoint, server: true

##
# NervesHub Device
#
config :nerves_hub_device, NervesHubDeviceWeb.Endpoint, server: true

##
# NervesHubWebCore
#
config :nerves_hub_web_core,
  allow_signups?: true,
  enable_workers: true,
  firmware_upload: NervesHubWebCore.Firmwares.Upload.File,
  host: "hub.airvizinc.com",
  port: 80

config :nerves_hub_web_core, NervesHubWebCore.Mailer,
  adapter: Bamboo.SMTPAdapter,
  tls: :always,
  ssl: false,
  retries: 1

config :nerves_hub_web_core, NervesHubWebCore.Repo, pool_size: 20

##
# NervesHubWWW
#
config :nerves_hub_www, NervesHubWWWWeb.Endpoint,
  load_from_system_env: true,
  server: true,
  https: [
    port: 443,
    otp_app: :nerves_hub_www,
    keyfile:    "/etc/letsencrypt/live/hub.airvizinc.com/privkey.pem",
    cacertfile: "/etc/letsencrypt/live/hub.airvizinc.com/chain.pem",
    certfile:   "/etc/letsencrypt/live/hub.airvizinc.com/cert.pem",
  ],
#  debug_errors: true,
  force_ssl: [rewrite_on: [:x_forwarded_proto]]
