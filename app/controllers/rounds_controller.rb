class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :edit, :update, :destroy]

  # GET /rounds
  # GET /rounds.json
  def index
    @rounds = Round.all

    if (params[:num_players] != nil)
      @num_players = params[:num_players]
    else
      @num_players = 4
    end

    if (params[:sort] == "score")
      @rounds = @rounds.sort_by{|e| -e[:score]}
    elsif (params[:sort] == "place")
      @rounds = @rounds.sort_by{|e| -e[:place]}
    elsif (params[:sort] == "asterisk")
      @rounds = @rounds.sort_by{|e| -e[:asterisk]}
    elsif (params[:sort] == "correct")
      @rounds = @rounds.sort_by{|e| -e[:correct]}
    elsif (params[:sort] == "taken")
      @rounds = @rounds.sort_by{|e| -(e.tricks_taken)}
    else 
      @rounds = @rounds.sort_by{|e| -e[:score]}
    end
    @rounds = @rounds.select{ |x| x.game.numplay == @num_players.to_i}
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
  end

  # GET /rounds/new
  def new
  	@game = Game.find(params[:game_id])
    @round = Round.new
  end

  # GET /rounds/1/edit
  def edit
  	@game = Game.find(params[:game_id])
  	@round = Round.find(params[:id])
  end

  # POST /rounds
  # POST /rounds.json
  def create
  	@game = Game.find(params[:game_id])
    @round = @game.rounds.new(round_params)

    respond_to do |format|
      if @round.save
        format.html { redirect_to @round, notice: 'Round was successfully created.' }
        format.json { render action: 'show', status: :created, location: @round }
      else
        format.html { render action: 'new' }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    respond_to do |format|
      if @round.update(round_params)
        format.html { redirect_to @round, notice: 'Round was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round.destroy
    respond_to do |format|
      format.html { redirect_to rounds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_round
      @round = Round.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def round_params
      params.require(:round).permit(:game_id, :score, :place, :correct, :asterisk, :player_id)
    end
end
