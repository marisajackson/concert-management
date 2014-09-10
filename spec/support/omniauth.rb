OmniAuth.config.test_mode = true

def set_omniauth(opts = {})
  default = {:provider => :facebook,
             :uuid     => "1234",
             :facebook => {
                            :email => "foobar@example.com",
                            :name => "MaRisa Jackson",
                            :image => "http://www.facebook.com/photo.jpg"
                          }
            }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = {
    'uid' => credentials[:uuid],
    "extra" => {
    "user_hash" => {
      "email" => user_hash[:email],
      "name" => user_hash[:name],
      "image" => user_hash[:image],
      }
    }
  }

  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]
end