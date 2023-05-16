class AccountsController < ApplicationController
  before_action :require_login

  def index
    @account = current_user.account
  end

  def new
    @account = Account.new
  end

  def create
    @account = current_user.build_account(account_params)
    if @account.save
      redirect_to root_path, notice: "you have successfully created an account!"
    else
      flash.now[:alert] = [@account.errors.full_messages].join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  private

    def account_params
      params.require(:account).permit(:cvv, :credit_card_number)
    end
end
