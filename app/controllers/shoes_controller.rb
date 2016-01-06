class ShoesController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
    @shoes = Shoe.where.not(purchased:true)
  end

  def new
  	@shoe = Shoe.new
  end

  def create
  	@shoe = Shoe.new(shoe_params)

    respond_to do |format|
      if @shoe.save
        format.html { redirect_to "/users/#{session[:user_id]}", alert: "Your product is for sale." }
        format.json { render :show, status: :created, location: @shoe }
      else
        format.html { redirect_to "/users/#{session[:user_id]}", alert: @shoe.errors.full_messages }
      end
    end
  end

  def update
  	@user = User.find(session[:user_id])
    @shoe = Shoe.find(params[:id])
  	shoe = Shoe.find(params[:id])
  	buyer = @user.first_name + " " + @user.last_name

  	shoe.update(purchased: true, buyer: buyer)

  	Purchase.create(user: User.find(session[:user_id]), shoe: Shoe.find(params[:id]), amount: @shoe.amount)
  	redirect_to "/users/#{session[:user_id]}"
  end

  def destroy
  	shoe = Shoe.find(params[:id])
  	shoe.destroy
  	redirect_to "/users/#{session[:user_id]}"

  end

  def shoe_params
  	params.require(:shoe).permit(:name, :amount, :user_id)
  end
end
