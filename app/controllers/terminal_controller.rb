class TerminalController < ApplicationController
  layout 'customerlayout'
  def login

  end

  def index
    # @appointments = User.find(session[:user_id]).appointments
    @appointment = Appointment.new
    
    @appointments = @appointment.get_appointments_by_instrument_id(1)

  end

  def validates
    login=params[:login]
    @user=User.where( email: login[:email] ).take

    if @user.email != ''
      session[:user_id]=@user.id
      session[:user_name]=@user.name
      session[:role_id]= @user.role_id
      redirect_to terminal_index_url
    else
      redirect_to terminal_login_url
    end
  end

end
