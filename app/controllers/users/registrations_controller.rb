class Users::RegistrationsController < Devise::RegistrationsController
  def create
    # inherit and extend create action
    super do |resource|
      # check if there are plan parameters ( in url )
      if params[:plan]
        resource.plan_id = params[:plan]
        # check if user's plan id is Pro
        if resource.plan_id == 2
          # do a "special save"
          resource.save_with_subscription
        else
          # user is coming from Basic form
          # just save them normally
          resource.save
        end
      end
    end
  end
end