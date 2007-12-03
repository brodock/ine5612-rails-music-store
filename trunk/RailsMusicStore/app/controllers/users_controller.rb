class UsersController < ApplicationController
  def index
    redirect_to "/"
  end

  attr_accessor :passwd
     
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
    :redirect_to => { :action => :list }

  def register
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.credits=0
    @user.total_spent=0
    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to :controller => 'main', :action => 'index'
    else
      render :action => 'register'
    end
  end

  #  def edit
  #    @user = User.find(params[:id])
  #  end

  #  def update
  #    @user = User.find(params[:id])
  #    if @user.update_attributes(params[:user])
  #      flash[:notice] = 'User was successfully updated.'
  #      redirect_to :action => 'show', :id => @user
  #    else
  #      render :action => 'edit'
  #    end
  #  end
  #
  #  def destroy
  #    User.find(params[:id]).destroy
  #    redirect_to :action => 'list'
  #  end
end
