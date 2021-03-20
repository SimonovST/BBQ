class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy, :show]

  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_event, only: [:show]
  before_action :set_current_user_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    # authorize @event
    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    @new_photo = @event.photos.build(params[:photo])
  end

  def new
    @event = current_user.events.build
  end

  def edit
    # authorize @event
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: I18n.t('controllers.events.created')
    else
      render :new
    end
  end

  def update
    # authorize @event
    if @event.update(event_params)
      redirect_to @event, notice: I18n.t('controllers.events.updated')
    else
      render :edit
    end
  end

  def destroy
    # authorize @event

    @event.destroy
    redirect_to events_path, notice: I18n.t('controllers.events.destroyed')
  end

   private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    # params.fetch(:event, {})
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
  end

  # def password_guard!
  #   # Если у события нет пин-кода, то охранять нечего
  #   # return true if @event.pincode.blank?
  #   # # Пин-код не нужен автору события
  #   # return true if signed_in? && current_user == @event.user

  #   # Если нам передали код и он верный, сохраняем его в куки этого юзера
  #   # Так юзеру не нужно будет вводить пин-код каждый раз
  #   if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
  #     cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
  #   end

  #   # Проверяем, верный ли в куках пин-код
  #   # Если нет — ругаемся и рендерим форму ввода пин-кода
  #   # pincode = cookies.permanent["events_#{@event.id}_pincode"]

  #   unless policy(@event).show?
  #     if params[:pincode].present?
  #       flash.now[:alert] = I18n.t('controllers.events.wrong_pincode')
  #     end
  #     render 'password_form'
    # end
  # end
end
