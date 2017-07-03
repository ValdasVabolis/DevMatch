class Users::RegistrationsController < Devise::RegistrationsController
  def create
    # extend default device gem behavior so that
    # users signing up with the Pro account (plan ID 2)
    # save with a special Stripe subscription function
    # otherwise devise signs up user as usual
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