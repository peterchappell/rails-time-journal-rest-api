class Api::V1::UsersController < ApiController
  respond_to :json

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  private

  def entry_params
    params.require(:user).permit(:name)
  end
end