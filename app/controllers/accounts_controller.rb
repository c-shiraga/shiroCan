class AccountsController < ApplicationController
    def show
        if user_signed_in?
            @user = current_user
            render "show"
        else
            render "top/index"
        end
    end
end
