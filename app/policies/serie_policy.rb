class SeriePolicy < ApplicationPolicy  
  
  def index?      
    user.role? :admin or user.role? :regular
  end 

  def show?      
    user.role? :admin or user.role? :regular
  end 

  def update?      
    user.role? :admin
  end  

  def create?  
    user.role? :admin
  end  

  def destroy?  
    user.role? :admin
  end  


end  