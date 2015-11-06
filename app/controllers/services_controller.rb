class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  respond_to :html, :xml, :json

  def index
    @services = Service.all
    respond_with(@services)
  end

  def show
    @comments = @service.comments.order(updated_at: :desc)
    @comment = Comment.new
    respond_with(@service, @comments, @comment) do |format|
      format.html { render }
      if user_signed_in?
        format.json { render json: @service.to_json(:include => :comments) }
      else
        format.json { render json: @service.to_json }
      end
    end
  end

  def new
    @service = Service.new
    @categories = Service.uniq.pluck(:category)
    respond_with(@service)
  end

  def edit
    @categories = Service.uniq.pluck(:category)
  end

  def create
    @service = Service.new(service_params)
    @service.save
    respond_with(@service)
  end

  def update
    @service.update(service_params)
    respond_with(@service)
  end

  def destroy
    @service.destroy
    respond_with(@service)
  end

  private
    def set_service
      @service = Service.find(params[:id])
      @boroughs = ['Bronx', 'Queens', 'Brooklyn', 'Manhattan', 'Statten Island']
    end

    def service_params
      params.require(:service).permit(
        :name,
        :category,
        :website,
        :notes,
        :phone,
        :address,
        :borough,
        :contact,
        :referral,
        :eligibility,
        :insurance
      )
    end
end
