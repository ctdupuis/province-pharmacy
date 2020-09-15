if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_province_pharmacy", domain: "province-client.herokuapp.com"
else   
    Rails.application.config.session_store :cookie_store, key: "_province_pharmacy"
end