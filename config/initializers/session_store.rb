if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_province_pharmacy", domain: "province-pharmacy.herokuapp.com", same_site: :none, secure: true
else   
    Rails.application.config.session_store :cookie_store, key: "_province_pharmacy"
end