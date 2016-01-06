class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:new, :create, :index]

  def show
  	@user = User.find(params[:id])
  	@my_shoes = Shoe.where(user_id:params[:id], purchased:false)
  	@sales = Shoe.where(user_id:params[:id], purchased:true)
    @sales_total = Shoe.where(user_id:params[:id], purchased:true).sum('amount')
  	@purchases = Purchase.where(user_id:params[:id])
    @purchases_total = Purchase.where(user_id:params[:id]).sum('amount')

  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)


    respond_to do |format|
      if @user.save
        format.html { redirect_to '/', alert: 'Registration successful! Please Log in below.' }
      else
        format.html { redirect_to '/', alert: @user.errors.full_messages }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
