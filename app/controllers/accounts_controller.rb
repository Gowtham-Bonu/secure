class AccountsController < ApplicationController
  before_action :require_login

  def index
    @account = current_user.account
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to root_path, notice: "you have successfully created an account!"
    else
      flash.now[:alert] = "invalid action!"
      render :new, status: :unprocessable_entity
    end
  end

  private

    def account_params
      params.require(:account).permit(:cvv, :credit_card_number, :user_id)
    end
end
