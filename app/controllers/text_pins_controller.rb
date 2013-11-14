class TextPinsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  # GET /text_pins
  # GET /text_pins.json
  def index
    @board= Board.find(params[:board_id])
    @text_pins = @board.text_pins.order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @text_pins }
    end
  end

  # GET /text_pins/1
  # GET /text_pins/1.json
  def show
    @text_pin = current_user.text_pins.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @text_pin }
    end
  end

  # GET /text_pins/new
  # GET /text_pins/new.json
  def new
    @board = Board.find(params[:board_id])
    @text_pin = current_user.text_pins.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @text_pin }
    end
  end

  # GET /text_pins/1/edit
  def edit
    @text_pin = current_user.text_pins.find(params[:id])
  end

  # POST /text_pins
  # POST /text_pins.json
  def create
    @text_pin = current_user.text_pins.create(params[:text_pin])

    respond_to do |format|
      if @text_pin.save
        format.html { redirect_to "/boards/#{@text_pin.board_id}", notice: 'Text pin was successfully created.' }
        format.json { render json: @text_pin, status: :created, location: @text_pin }
      else
        format.html { render action: "new" }
        format.json { render json: @text_pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /text_pins/1
  # PUT /text_pins/1.json
  def update
    @text_pin = current_user.text_pins.find(params[:id])

    respond_to do |format|
      if @text_pin.update_attributes(params[:text_pin])
        format.html { redirect_to @text_pin, notice: 'Text pin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @text_pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_pins/1
  # DELETE /text_pins/1.json
  def destroy
    @text_pin = current_user.text_pins.find(params[:id])
    @text_pin.destroy

    respond_to do |format|
      format.html { redirect_to text_pins_url }
      format.json { head :no_content }
    end
  end
end
