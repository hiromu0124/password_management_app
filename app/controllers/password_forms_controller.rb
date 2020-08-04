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
    if @passwords.save
      if @passwords.terms1=="1"
        @password=[*'A'..'Z', *'a'..'z', *0..9].shuffle[0..7].join
        render root_path
      else
        @password="12345678"
      end
    else
    end
    binding.pry
  end
  private
  def terms_params
    params.permit(:terms1, :terms2, :terms3, :terms4, :terms5)
  end
end
