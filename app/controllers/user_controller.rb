class UserController < ApplicationController
#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------
  
  layout "user"
  
#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------

  def index
    @objects = User.all
  end

#--------------------------------------------------------------------------------------------------------------------------------

  def show
    @id  = params[:id]
    @object = User.first(:conditions=>{:id=>@id})
  end
  
#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------
end