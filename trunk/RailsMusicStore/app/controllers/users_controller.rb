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
      # passando objeto como parametro pra transaction, mantem eles
      # transaction safe também
      User.transaction @current_user do 
        MusicsUser.transaction do
          if @current_user.credits > 0
            @current_user.credits = @current_user.credits-1
            @current_user.total_spent = @current_user.total_spent+1
      
            @bought_music = MusicsUser.new(:user_id => @current_user.id, :music_id => params[:id], :date => Date.today)
          
            # Inicia os metodos de persistencia
            begin
              if @bought_music.save and @current_user.save
                flash[:music] = "Compra realizada com sucesso..."
              end
            rescue
              # substituir por algo semanticalmente melhor como :error (verificar como ele exibira tal comportamento)
              flash[:music] = "Você já possui esta música, não é necessário comprá-la novamente :)"
            end
          
            # Terminou? Retorna a página inicial
            redirect_to :controller => 'main', :action => 'my_musics'
          else
            flash[:music] = "Você não tem créditos suficientes para realizar a compra!"
            redirect_to :controller => 'main', :action => 'my_musics'
          end
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
