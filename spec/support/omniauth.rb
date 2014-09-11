OmniAuth.config.test_mode = true

def set_omniauth
  OmniAuth.config.add_mock(:facebook, {
    uid: "1234",
     info: {
      email: "foobar@example.com",
      name: "MaRisa Jackson",
      image: "http://www.facebook.com/photo.jpg"
    },
  })
end