class ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    puts params
    event = Event.find(params[:event_id])
    items = event.items.build(item_params)
    if items.save
      render json: items, status: :created
    else
      render json: items.errors, status: :unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: item.errors
    end
  end

  def destroy
      Item.find(params[:id]).destroy
      render json: {status: 204}
  end
end

private

def item_params
  params.require(:item).permit(:name, :cost, :event_id)
end
