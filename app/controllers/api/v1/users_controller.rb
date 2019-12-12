class Api::V1::UsersController < ApplicationController

  skip_before_action :authenticate_request, only: %i[login register]

  def index
    data = {:personal_info => {:name=>"Zaigham Ali", :number=>"03003720051"}, :billing_info => {:total_bill=>1000, :unpaid_bill=> 1306, :last_updated=> Date.today.to_s}, :remaining_usage => {:consumed => {:data => "19", :credit_limit => "3,000", :calls => "792"}, :total => {:data => "1,000", :credit_limit => "5,000", :calls => "5,000"}}, :units => {:credit_limit => "Rs", :call => "mins", :data => "MB"}}
    render json: data
    # render error: {error: "hello"}, status: 400
  end

  def packages
    data = {:data => [{:title=>"Monthly Streamer", :validity=>30, :validity_unit => "Days", :volume => 2000, :volume_unit => "MB", :price => 250.00, :price_unit => "Rs"},{:title=>"Monthly Mega", :validity=>30, :validity_unit => "Days", :volume => 24000, :volume_unit => "MB", :price => 1200.00, :price_unit => "Rs"},{:title=>"Monthly Ultimate", :validity=>30, :validity_unit => "Days", :volume => 50000, :volume_unit => "MB", :price => 2200.00, :price_unit => "Rs"},{:title=>"Monthly Premium", :validity=>1, :validity_unit => "Month", :volume => 5000, :volume_unit => "MB", :price => 500.00, :price_unit => "Rs"}],
            :calls => [{:title=>"J All Net Budget", :validity=>1, :validity_unit => "Month", :volume => 500, :volume_unit => "Mins", :price => 500.00, :price_unit => "Rs"},{:title=>"100 All Net", :validity=>30, :validity_unit => "Days", :volume => 100, :volume_unit => "Mins", :price => 125.00, :price_unit => "Rs"},{:title=>"200 All Net", :validity=>30, :validity_unit => "Days", :volume => 100, :volume_unit => "Mins", :price => 250.00, :price_unit => "Rs"},{:title=>"J All Network Lite", :validity=>1, :validity_unit => "Month", :volume => 100, :volume_unit => "Mins", :price => 100.00, :price_unit => "Rs"},{:title=>"J All Network Mini", :validity=>1, :validity_unit => "Month", :volume => 200, :volume_unit => "Mins", :price => 200.00, :price_unit => "Rs"},{:title=>"J All Net Smart", :validity=>1, :validity_unit => "Month", :volume => 300, :volume_unit => "Mins", :price => 300.00, :price_unit => "Rs"},{:title=>"J All Net Super", :validity=>1, :validity_unit => "Month", :volume => 400, :volume_unit => "Mins", :price => 400.00, :price_unit => "Rs"}]}
  #  data = {:personal_info => {:name=>"Zaigham Ali", :number=>"03003720051"}, :billing_info => {:total_bill=>1000, :unpaid_bill=> 1306, :last_updated=> Date.today.to_s}, :remaining_usage => {:consumed => {:data => "19", :credit_limit => "3,000", :calls => "792"}, :total => {:data => "1,000", :credit_limit => "5,000", :calls => "5,000"}}, :units => {:credit_limit => "Rs", :call => "mins", :data => "MB"}}
    render json: data
    # render error: {error: "hello"}, status: 400
  end

  # [...]
  def login
    authenticate params[:mobile_num], params[:password]
  end

  def test
    render json: {
        message: 'You have passed authentication and authorization test'
    }
  end
  # [...]

  # [...]
  private
  def authenticate(mobile_num, password)
    command = AuthenticateUser.call(mobile_num, password)

    if command.success?
      render json: {
          access_token: command.result,
          message: 'Login Successful'
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
  # [...]

  def new

  end

end
