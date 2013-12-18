class Api::V1::ActivitiesController < ApiController
  respond_to :json

  def index
    respond_with current_user.activities
  end

  def show
    respond_with current_user.activity.find(params[:id])
  end

  def create
    return _not_authorized unless signed_in?
    respond_with current_user.activities.create(activity_params)
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :notes)
  end

  def activity_url(activity)
    api_v1_activity_path(activity)
  end

end