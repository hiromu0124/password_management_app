class PasswordFormsController < ApplicationController
  def show
    
  end
  def new
    
  end
  def create
    @passwords=Password.new
    session[:terms1]=terms_params[:terms1]
    session[:terms2]=terms_params[:terms2]
    session[:terms3]=terms_params[:terms3]
    session[:terms4]=terms_params[:terms4]
    session[:terms5]=terms_params[:terms5]
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
      if session[:terms3]=="1"
        z='~','!','@','#','$','%','^','&','*','(',')','-','+'
      else
        z='a'..'z'
      end
      
      session[:password]=terms_params[:password]=[*x, *'a'..'z', *y,z].shuffle[0..7].join
      @passwords=password_create
  end
  private
  def terms_params
    params.require(:session).permit(:terms1, :terms2, :terms3, :terms4, :terms5, :password)
  end
  def password_create
    Password.create(
      terms1: session[:terms1],
      terms2: session[:terms2],
      terms3: session[:terms3],
      terms4: session[:terms4],
      terms5: session[:terms5],
      password: session[:password]
    )
  end
end
