class CreditsController < ApplicationController
  def buy
    
    
    if request.post?
      User.transaction @current_user do
        @current_user.credits = @current_user.credits + params[:credits].to_i
        @current_user.save
      end
      flash[:notice] = "Compra de créditos realizada com sucesso!"
      redirect_to :controller => 'main'
    else
    render :layout => 'ajax'
    end
  end
end