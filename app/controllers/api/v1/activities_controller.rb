class Api::V1::ActivitiesController < ApiController
  respond_to :json

  def index
    respond_with current_user.activities
  end

  def show
    respond_with current_user.activity.find(params[:id])
  end

  private

  def entry_params
    params.require(:activity).permit(:name)
  end

end