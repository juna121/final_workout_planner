Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "workouts#index"
  # Routes for the Bodypart resource:

  # CREATE
  get("/bodyparts/new", { :controller => "bodyparts", :action => "new_form" })
  post("/create_bodypart", { :controller => "bodyparts", :action => "create_row" })

  # READ
  get("/bodyparts", { :controller => "bodyparts", :action => "index" })
  get("/bodyparts/:id_to_display", { :controller => "bodyparts", :action => "show" })

  # UPDATE
  get("/bodyparts/:prefill_with_id/edit", { :controller => "bodyparts", :action => "edit_form" })
  post("/update_bodypart/:id_to_modify", { :controller => "bodyparts", :action => "update_row" })

  # DELETE
  get("/delete_bodypart/:id_to_remove", { :controller => "bodyparts", :action => "destroy_row" })

  #------------------------------

  # Routes for the Circuit resource:

  # CREATE
  get("/circuits/new", { :controller => "circuits", :action => "new_form" })
  post("/create_circuit", { :controller => "circuits", :action => "create_row" })

  # READ
  get("/circuits", { :controller => "circuits", :action => "index" })
  get("/circuits/:id_to_display", { :controller => "circuits", :action => "show" })

  # UPDATE
  get("/circuits/:prefill_with_id/edit", { :controller => "circuits", :action => "edit_form" })
  post("/update_circuit/:id_to_modify", { :controller => "circuits", :action => "update_row" })

  # DELETE
  get("/delete_circuit/:id_to_remove", { :controller => "circuits", :action => "destroy_row" })

  #------------------------------

  # Routes for the Exercise resource:

  # CREATE
  get("/exercises/new", { :controller => "exercises", :action => "new_form" })
  post("/create_exercise", { :controller => "exercises", :action => "create_row" })

  # READ
  get("/exercises", { :controller => "exercises", :action => "index" })
  get("/exercises/:id_to_display", { :controller => "exercises", :action => "show" })

  # UPDATE
  get("/exercises/:prefill_with_id/edit", { :controller => "exercises", :action => "edit_form" })
  post("/update_exercise/:id_to_modify", { :controller => "exercises", :action => "update_row" })

  # DELETE
  get("/delete_exercise/:id_to_remove", { :controller => "exercises", :action => "destroy_row" })

  #------------------------------

  # Routes for the Workout resource:

  # CREATE
  get("/workouts/new", { :controller => "workouts", :action => "new_form" })
  post("/create_workout", { :controller => "workouts", :action => "create_row" })

  # READ
  get("/workouts", { :controller => "workouts", :action => "index" })
  get("/workouts/:id_to_display", { :controller => "workouts", :action => "show" })

  # UPDATE
  get("/workouts/:prefill_with_id/edit", { :controller => "workouts", :action => "edit_form" })
  post("/update_workout/:id_to_modify", { :controller => "workouts", :action => "update_row" })

  # DELETE
  get("/delete_workout/:id_to_remove", { :controller => "workouts", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
