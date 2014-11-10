class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
       def get_result info
    "{success:true,info:\"#{info}\"}"
  end

  def get_json count,json 
    "{totalProperty:#{count},root:#{json}}"
  end
end
