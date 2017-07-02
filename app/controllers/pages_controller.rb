class PagesController < ApplicationController
  # GET request for / (homepage)
  # Pro plan id in Plan db is 1, Basic plan id is 2
  def home
    # Plan.find(id) returns the record from Plan db
    # These variables will be accessible in home.html.erb file
    @basic_plan = Plan.find(1)
    @pro_plan = Plan.find(2)
  end
  
  def about
    
  end
end