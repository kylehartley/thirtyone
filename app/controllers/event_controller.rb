class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @new_event=Event.new
    year = params[:year].to_s()
    if year.length > 0
      t=(params[:year].to_s() + '/' + params[:month].to_s() + '/' + params[:day].to_s())
      @new_event.start_at = t.to_date
    else
      @new_event.start_at=(Date.today())
    end
  end


  def update
    @edit_event=Event.find(params[:id])
    @edit_event.name = params[:event][:name]
    @edit_event.start_at = params[:event][:start_at]
    @edit_event.end_at = params[:event][:end_at]
    #@edit_event.save
    respond_to do |format|
      if @edit_event.save
        format.html { redirect_to action: 'index'}
      else
        format.html { redirect_to action: 'new' }
      end
    end
  end

  def edit
    @edit_event=Event.find(params[:id])
  end

  def delete

  end

  def show
    @event=Event.find(params[:id])
  end

  def destroy
    @event=Event.all
    @event.destroy(params[:id])
    redirect_to action: 'index'
  end

  def create
    @event=Event.new
    @event.name = params[:event][:name]
    @event.start_at = params[:event][:start_at]
    @event.end_at = params[:event][:end_at]


    respond_to do |format|
      if @event.save
        format.html { redirect_to action: 'index'}
      else
        format.html { redirect_to action: 'new' }
      end
    end
  end
end
