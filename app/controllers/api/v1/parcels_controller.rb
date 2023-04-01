module Api
  module V1
    class ParcelsController < ApplicationController
      before_action :read_parcel, only: %i[show destroy]
      before_action :authorize_request, only: %i[create destroy]

      def index
        parcels = Parcel.all
        render json: parcels
        
      end

      def show
       @parcel = Parcel.where(user_id:params[:id] )
        render json: @parcel
       Parcel.destroy_by(user_id:params[:id])
        
        
      end

      def create
        parcel = Parcel.new(create_parcel_params)

        if parcel.save
          render json: parcel
        else
          render json: parcel.errors.full_messages
        end
      end

      def destroy
        if @parcel.destroy
          render json: 'parcel deleted successfully'
        else
          render json: @parcel.errors.full_messages
        end
      end

      private

      def create_parcel_params
        params.require(:parcel).permit!
      end

      def read_parcel
        # @parcel = Parcel.where(user_id:params[:id] )
        # render json: @parcel
        # add Delete parcels after reading them here.also create another backup to delete after a month
      end
    end
  end
end
