RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true


  RailsAdmin.config do |config|
  config.main_app_name = ["PetsParadise"]
  config.main_app_name = Proc.new { |controller| [ "PetsParadise - #{controller.params[:action].try(:titleize)}" ] }
  end

  RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :manager
  end
  config.current_user_method(&:current_manager)
  end

  RailsAdmin.config do |config|
  config.authorize_with :cancan
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end