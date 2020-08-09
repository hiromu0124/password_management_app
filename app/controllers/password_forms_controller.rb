class PasswordFormsController < ApplicationController
  def index
    @passwords=Password.all
  end
  def show
    
  end
  def new_url
    @passwords=Password.new
    session[:app_name]=terms_params[:app_name]
    session[:app_url]=terms_params[:app_url]
    
  end

  def new
    
  end
  def create
    @passwords=Password.new
    session[:terms1]=terms_params[:terms1]
    session[:terms2]=terms_params[:terms2]
    session[:terms3]=terms_params[:terms3]
    session[:terms4]=terms_params[:terms4]
      if session[:terms1]=="1"
        x='A'..'Z'
      else
        x='a'..'z'
      end
      if session[:terms2]=="1"
        y=0..9
      else
        y='a'..'z'
      end
      if session[:terms4]==""
        a=19
      else
        a=session[:terms4].to_i-1
      end
      if session[:terms3]=="1"
        session[:password]=[*('a'..'z'),*(x),*(y),'~','!','@','#','$','%','^','&','*','(',')','-','+'].shuffle[0..a].join
      else
        session[:password]=[*('a'..'z'),*(x),*(y)].shuffle[0..a].join
      end
      
      
      @passwords=password_create
      redirect_to password_forms_path
  end
  private
  def terms_params
    params.require(:session).permit(
      :terms1,
      :terms2,
      :terms3,
      :terms4,
      :password,
      :app_name,
      :app_url
    )
  end
  def password_create
    Password.create(
      terms1:   session[:terms1],
      terms2:   session[:terms2],
      terms3:   session[:terms3],
      terms4:   session[:terms4],
      password: session[:password],
      app_name: session[:app_name],
      app_url:  session[:app_url]
    )
  end
end
