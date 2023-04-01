module Api
  module V1
    class ParcelcopiesController < ApplicationController
      before_action :read_parcelcopies, only: %i[show destroy]
      before_action :authorize_request, only: %i[create destroy]

      def index
        parcelcopies = Parcelcopies.all
        render json: parcelcopies
      end

      def show
        render json: @parcelcopies
      end

      def create
        parcelcopies = Parcelcopies.new(create_parcelcopies_params)

        if parcelcopies.save
          render json: parcelcopies
        else
          render json: parcelcopies.errors.full_messages
        end
      end

      def destroy
        if @parcelcopies.destroy
          render json: 'parcel deleted successfully'
        else
          render json: @parcelcopies.errors.full_messages
        end
      end

      private

      def create_parcelcopies_params
        params.require(:parcelcopy).permit!
      end

      def read_parcelcopies
        @parcelcopies = Parcelcopies.where(user_id:params[:id] )
        # add Delete parcels after reading them here.also create another backup to delete after a month
      end
    end
  end
end
