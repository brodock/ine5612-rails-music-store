class UsersController < ApplicationController
  def index
    redirect_to "/"
  end

  attr_accessor :passwd
     
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
    :redirect_to => { :action => :index }

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
  
  def buy
    unless @current_user.blank? 
      User.transaction do
        MusicsUser.transaction do
          @current_user.credits = @current_user.credits-1
      
          @bought_music = MusicsUser.new(:user_id => @current_user.id, :music_id => params[:id], :date => Date.today)
          @bought_music.save
      
          @current_user.save
        end
      end
    else
      redirect_to :action => 'login'
    end
    
  end

  
  
  # Login systems
  def login
    if request.post?
      @current_user = User.authenticate(params[:login], params[:password])
      unless @current_user.nil?
        session[:user_id] = @current_user.id
        redirect_to :controller => 'main'
      end
    end
  end
  
  def logout
    session[:user_id] = @current_user = nil
  end
  
  
  def edit
    unless @current_user.blank?
      @user = @current_user
    else
      redirect_to :action => 'login'
    end
  end

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
