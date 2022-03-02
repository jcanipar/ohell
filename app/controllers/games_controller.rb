class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    if (params[:num_players] != nil)
      @num_players = params[:num_players]
      @games = Game.where(numplay: @num_players)
    else
      @games = Game.all
    end

    
    @games = @games.order(date: :desc)
  end

  # GET /games/1
  # GET /games/1.json
  def show
    #@game.round = @game.rounds.sort_by{|e| e[:place]}
    #@player_stats = @player_stats.sort_by{|e| -e[:wins]}
  end

  def scorecard
    @game = Game.new
    4.times {@game.rounds.new}
    @game.numPlay = 4
  end


  # GET /games/new
  def new
    @game = Game.new

    players = params[:num_players].to_i
    
    if players < 3
      players = 4
    end 

    players.times {@game.rounds.new} 
    @game.numplay = players
    
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
    
    @game.rounds.sort_by{|e| e[:place]}
    @game.rounds.each do |round|
      puts round.score.to_s
    end
  end

  # POST /games
  # POST /games.json
  def create
    temp_game = Game.new()
    temp_game.date = game_params[:date].to_date
    temp_game.numplay = game_params[:numplay]
    temp_game.backwards = game_params[:backwards]
    temp_game.notrump = game_params[:notrump]
    temp_game.description = game_params[:description]

    puts game_params[:rounds_attributes]

    game_params[:rounds_attributes].each do |r|
      puts "0: " + r[0]
      puts "1: " + r[1][:score]
      # score = r[1][:score]
      # place = r[1][:place]
      # correct = r[1][:correct]
      # asterisk = r[1][:asterisk]
      # player_id = r[1][:player_id]
      myround = Round.new(r[1])
      temp_game.rounds << myround
    end

    puts temp_game

    message = ""
    temp_rounds = temp_game.rounds.sort_by{|e| -e[:score]}
    place = 0
    @game = temp_game
    temp_rounds.each do |round|
      place = place + 1
      round.place = place
      @game.rounds << round
      message = message + " " + round.player.nickname + " place set to " + place.to_s
    end


    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: message }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update

    atts = game_params[:rounds_attributes]

    temp_rounds = []
    temp_rounds_ordered = []

    #go through the rounds, add them to an array
    atts.each do |round|
      around = Round.new(round[1])
      temp_rounds << around
      puts around.to_s
      puts around.id.to_s
      puts round[1].class
    end

    #sort the new round order
    temp_rounds = temp_rounds.sort_by{|e| -e[:score]}
    place = 0
    

    #set the correct place in the temp array
    temp_rounds.each do |round|
      place = place + 1
      round.place = place
      temp_rounds_ordered << round
    end

    @game = Game.find(params[:id])

    @game.rounds.each do |round|      
      temp_rounds_ordered.each do |tr|        
        if tr.id == round.id          
          round.place = tr.place
          round.player_id = tr.player_id
          round.score = tr.score
          round.asterisk = tr.asterisk
          round.correct = tr.correct
        end
      end
    end

    @game.description = game_params[:description]
    @game.date = game_params[:date].to_date

    puts @game.rounds.size

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: "Game updated successfully!" }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    puts @game.date.to_s
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:date, :numplay, :description, :league, :backwards, :notrump, 
        rounds_attributes: [:score, :place, :correct, :asterisk, :player_id, :id])
    end
end
