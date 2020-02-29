Rails.application.routes.draw do



  # Routes for the Transaction resource:

  # CREATE
  match("/insert_transaction", { :controller => "transactions", :action => "create", :via => "post"})
          
  # READ
  match("/transactions", { :controller => "transactions", :action => "index", :via => "get"})
  
  match("/transactions/:id_from_path", { :controller => "transactions", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_transaction/:id_from_path", { :controller => "transactions", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_transaction/:id_from_path", { :controller => "transactions", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Portfolio resource:

  # CREATE
  match("/insert_portfolio", { :controller => "portfolios", :action => "create", :via => "post"})
          
  # READ
  match("/portfolios", { :controller => "portfolios", :action => "index", :via => "get"})
  
  match("/portfolios/:id_from_path", { :controller => "portfolios", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_portfolio/:id_from_path", { :controller => "portfolios", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_portfolio/:id_from_path", { :controller => "portfolios", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for signing up

  match("/user_sign_up", { :controller => "users", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form", :via => "get"})
  
  match("/user_verify_credentials", { :controller => "user_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/user_sign_out", { :controller => "user_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_user", { :controller => "users", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_user", { :controller => "users", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_user", { :controller => "users", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_user_account", { :controller => "users", :action => "destroy", :via => "get"})


  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
