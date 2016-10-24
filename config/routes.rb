TechReviewSite::Application.routes.draw do
  root  'products#index'
  get   'products/:producrs_id'  =>  'products#show'
  
end
