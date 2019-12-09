class Api::V1::UsersController < ApplicationController

  def index
    data = {:personal_info => {:name=>"Zaigham Ali", :number=>"03003720051"}, :billing_info => {:total_bill=>1000, :unpaid_bill=> 1306, :last_updated=> Date.today.to_s}, :remaining_usage => {:consumed => {:data => "19", :credit_limit => "3,000", :calls => "792"}, :total => {:data => "1,000", :credit_limit => "5,000", :calls => "5,000"}}, :units => {:credit_limit => "Rs", :call => "mins", :data => "MB"}}
    render json: data
    # render error: {error: "hello"}, status: 400
  end

  def packages
    data = {:personal_info => {:name=>"Zaigham Ali", :number=>"03003720051"}, :billing_info => {:total_bill=>1000, :unpaid_bill=> 1306, :last_updated=> Date.today.to_s}, :remaining_usage => {:consumed => {:data => "19", :credit_limit => "3,000", :calls => "792"}, :total => {:data => "1,000", :credit_limit => "5,000", :calls => "5,000"}}, :units => {:credit_limit => "Rs", :call => "mins", :data => "MB"}}
    render json: data
    # render error: {error: "hello"}, status: 400
  end


end
