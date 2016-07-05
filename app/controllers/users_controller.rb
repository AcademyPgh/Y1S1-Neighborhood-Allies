class UsersController < ApplicationController
    before_filter :authenticate_user!
    
    def log_out
        sign_out(@user)
    end
    
end
