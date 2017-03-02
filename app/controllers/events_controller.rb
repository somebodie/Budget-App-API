class EventsController < ApplicationController
  def index
    render json: Event.all
  end

  def show
    render json: Event.find(params[:id])
  end

  def create
    user = User.find(params[:user_id])
    events = user.events.build(event_params)
    # http://stackoverflow.com/questions/22446647/undefined-method-model-url
    if events.save

      render json: events, status: :created
    else
      render json: events.errors, status: :unprocessable_entity
    end
    # eval.binding.pry
  end

  def update
    event = Event.find(params[:id])
    if event.update(event_params)
      render json: event
    else
      render json: event.errors
    end
  end

  def destroy
      Event.find(params[:id]).destroy
      render json: {status: 204}
  end


  private

    def event_params
    params.require(:event).permit(:name, :budget, :user_id)
    end
end
