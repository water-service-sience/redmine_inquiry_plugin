# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get "geo_info", :to => "geo_info#index"
get "geo_info/new", :to => "geo_info#new"
post "geo_info/new", :to => "geo_info#new"
get "customer", :to => "customer#index"
get "customer/new", :to => "customer#new"
get "customer/detail", :to => "customer#detail"
post "customer/new", :to => "customer#new"
get "customer/edit", :to => "customer#edit"
post "customer/edit", :to => "customer#edit"
get "customer/search", :to => "inquiry_search#find_customers"
get "geo_info/public_places", :to => "inquiry_search#public_places"
get "geo_info/own_lands", :to => "inquiry_search#own_lands"
get "geo_info/geo_info/:geo_info_id", :to => "inquiry_search#geo_info"