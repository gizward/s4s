class UsersController < ApplicationController
#--------------------------------------------------------------------------------------------------------------------------------

  before_filter :authenticate_user!
  
  include RController
  include RControllerExtrasLite
  
#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------

  def filter_settings
    @filter.register_search_fields('id','email','name')
    @filter.set_sort_by_and_order('name','ASC')
  end

  def do_before_each
    @class_flags = live_data_flag
  end
  
#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------
# generate edit_x and update_x pairs for various fields

  [:address,:password].each do |field|

    define_method("edit_#{field}") do
      @object = User.find(params[:id])
    end
  
    define_method("update_#{field}") do
      @object = User.find(params[:id])
      if @object.update_attributes(params[model_sym])
        EventLogger.log(current_user,@object,action_name)
        show_what = "?show[#{field}]=yes"
        show_what = '' if field==:roles
        show_what = '' if field==:password
        redirect_to("/users/#{@object.id}#{show_what}", :notice=>"Object's #{field} updated.")
      else
        render :action => "edit_#{field}"
      end
    end

  end

#--------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------
end
