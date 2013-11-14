class PinsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  # GET /pins
  # GET /pins.json
  def index
    @board= Board.find(params[:board_id])
    @pins = @board.pins.order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pins }
    end
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
    @pin = Pin.find(params[:id])
    @board = params[:board_id]
    @comment = Comment.new
    @comments = Comment.where(commentable_type: Pin, commentable_id: @pin)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pin }
    end
  end

  # GET /pins/new
  # GET /pins/new.json
  def new
    @board = Board.find(params[:board_id])
    @pin = current_user.pins.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pin }
    end
  end

  # GET /pins/1/edit
  def edit
    @board = Board.find(params[:board_id])
    @pin = current_user.pins.find(params[:id])
  end

  # POST /pins
  # POST /pins.json
  def create

    @pin = current_user.pins.create(params[:pin])


    respond_to do |format|
      if @pin.save
        format.html { redirect_to "/boards/#{@pin.board_id}", notice: 'Pin was successfully created.' }
        format.json { render json: @pin, status: :created, location: @pin }
      else
        format.html { render action: "new" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pins/1
  # PUT /pins/1.json
  def update
    @board = Board.find(params[:board_id])
    @pin = current_user.pins.find(params[:id])

    respond_to do |format|
      if @pin.update_attributes(params[:pin])
        format.html { redirect_to board_pin_path(@board, @pin), notice: 'Pin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @board = params[:board_id]
    @pin = current_user.pins.find(params[:id])
    @pin.destroy

    respond_to do |format|
      format.html { redirect_to board_path(@board)}
      format.json { head :no_content }
    end
  end
end
