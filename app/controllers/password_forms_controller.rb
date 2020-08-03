class PasswordFormsController < ApplicationController
  def new
    
  end
  private
  def terms_params
    params.requrire.(:session).permit(:terms1, :terms2, :terms3, :terms4)
  end
end
