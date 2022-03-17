class EntityController < ApplicationController
    def new
        @group = Group.find(params[:group_id])
        @money_track = Entity.new
      end

      def create
        @group = Group.find(params[:group_id])
        @money_track = @group.entities.create(moneytrack_params)
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
        params.require(:entity).permit(:name, :amount, :user_id)
      end
end
