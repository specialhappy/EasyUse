class TerminalController < ApplicationController
  layout 'customerlayout'
  def login
    
  end
  
  def index
  # @appointments = User.find(session[:user_id]).appointments
  
    @appointments = Instrument.first.appointments.where("date<=?",format_todate).order(date: :asc, time: :asc)

    #@appointments=@appointments.where()

  end
  
  
  
  
  def validates
    login=params[:login]
    @user=User.where( email: login[:email] ).take
    
    if @user.email != ''
      session[:user_id]=@user.id
      session[:user_name]=@user.name
      redirect_to terminal_index_url
    else
      redirect_to terminal_login_url
    end
  end
  
  
  private 
  
  def format_todate
     #Date date=new Date()
  #  SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd")
    # String time=df.format(date)
    
    time = Time.now
    time.strftime("YYYY-MM-DD")
    
end

def format_totime
     #Date date=new Date()
  #  SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd")
    # String time=df.format(date)
    
    time = Time.now
    time.strftime("hh:mm")
    
end
end
