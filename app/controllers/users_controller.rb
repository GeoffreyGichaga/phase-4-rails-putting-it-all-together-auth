class UsersController < ApplicationController
rescue_from ActiveRecords::RecordInvalid,with: :render_unprocessable_entity
    skip_before_action :authorize, only: :create
    
    def create
        user = User.create(params_info)
        sessions[:user_id] = user.id

        render json: user ,status: :created

    end 


    def show
        user = User.find(sessions[:user_id])
        render json: user ,status: :created

    end 




    private
    def params_info
        params.permit(:username,:password,:image_url,:bio)
    end

    def render_unprocessable_entity

        render json: {error: "Invalid Username or Password"},status: :unprocessable_entity
    end
end



