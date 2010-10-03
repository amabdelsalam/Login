class RolesController < ApplicationController
  before_filter :check_administrator_role
  
  def index
    flash[:title] = "Roles Administration"
    flash[:text] = " Roles allows site administrator to assign/unassign roles from users"
    flash[:more] = nil

    #@user = User.find(params[:user_id])
    @all_roles = Role.find(:all)
  end
  
  def new
    @role = Role.new
  end
  
  def show
    @role = Role.find(params[:id])
    
    flash[:title] = "Administering Role: #{@role.name}"
    flash[:text] = ""
    flash[:more] = nil

    
  end
  
    def save
    @role = Role.find(params[:id])
    @user = User.find(params[:user])
    if params[:show] == "true"
      @role.users << @user
    else
      @role.users.delete(@user)
    end
    @role.save!
    render :nothing => true
  end
  
  def show_users
    @role = Role.find(params[:id])
  end

  
  def create
    @role = Role.new(params[:role])
    if @role.save
      
      flash[:notice] = "Role has been created."
      redirect_to @role
    else
      render :action => 'new'  
    end    
  end
  
  
  def update
    @user = User.find(params[:user_id])
    @role = Role.find(params[:id])
    unless @user.has_role?(@role.name)
      @user.roles << @role
    end
    redirect_to :action => 'index'
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @role = Role.find(params[:id])
    if @user.has_role?(@role.name)
      @user.roles.delete(@role)
    end
    redirect_to :action => 'index'
  end
  
end
