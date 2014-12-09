class User < ActiveRecord::Base
  belongs_to :institution
  belongs_to :role
  has_many :instruments
  has_many :appointments
  has_many :messages
  has_and_belongs_to_many :groups
  
  def register(register)
    self.name = register[:name]
    self.email = register[:email]
    self.password = register[:password]
    self.role_id = 1
    self.save
    return true
  end

  def validates(login)
    @user = User.where( email: login[:email] ).take
    if @user ==nil
    return false
    else if @user.password == login[:password]
      self.id = @user.id
      self.name = @user.name
      return true
      else
      return false
      end
    end
  end

end
