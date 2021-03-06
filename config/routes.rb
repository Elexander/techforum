Techforum::Application.routes.draw do

  get "dashboards/main"

  get "welcome/index"
  get 'dashboards/posts', to: 'dashboards#listpost'

  devise_for :users , :controllers => { registrations: 'users/registrations', :omniauth_callbacks => "users/omniauth_callbacks" }


  root :to => "dashboards#main"

  get 'posts/index'
  get 'posts/questionswindow'
  get 'posts/discussionswindow'
  get 'posts/myposts'
  get 'posts/search'

  get 'topics/admin_editor' 
  post 'topics/admin_editor' 

  resources :posts do
    resources :comments
  end 

  devise_scope :user do
    match '/confirm/:confirmation_token', :to => "devise/confirmations#show", :as => "user_confirm", :only_path => false
  end

  resources :posts
  resources :comments
  resources :topics

  #root :to => "posts#index"

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  
  post '/comments/votes/', to: 'comments#vote'
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

  get "users/check_email"#, :controller => "users", :action => "/check_email" 
  #resources.map => :users

  #devise_for :controllers => { :registrations => "registrations" }

  #devise_for :members, :controllers => { :registrations => "registrations" }

  # root :to => "comments#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
