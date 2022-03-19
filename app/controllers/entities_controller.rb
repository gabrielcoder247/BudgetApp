class EntitiesController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @money_track = Entity.new
    @params = params
  end

  def create
    @group = Group.find(params[:group_id])
    @money_track = Entity.new(name: moneytrack_params[:name], amount: moneytrack_params[:amount], user_id: current_user.id, group_id: params[:group_id])
    # @money_track .user_id = current_user.id
    if @money_track.save
      flash[:notice] = 'Transaction created successfully.'
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    @money_track = Entity.find(params[:id])
    authorize! :destroy, @money_track
    flash[:notice] = if @money_track.destroy
                       'Transaction removed successfully'
                     else
                       'Something went wrong'
                     end
    redirect_to root_path
  end

  private

  def moneytrack_params
    params.require(:entity).permit(:name, :amount, :user_id, :group_id)
  end
end
