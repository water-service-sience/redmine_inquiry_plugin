# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get "geo_info", :to => "geo_info#index"
get "geo_info/new", :to => "geo_info#new"
post "geo_info/new", :to => "geo_info#new"
get "customer", :to => "customer#index"
get "customer/new", :to => "customer#new"
post "customer/new", :to => "customer#new"
get "customer/edit", :to => "customer#edit"
post "customer/edit", :to => "customer#edit"
get "customer/search", :to => "inquiry_search#find_customers"