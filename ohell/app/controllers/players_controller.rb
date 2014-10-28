class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all
  end

  # GET /players
  # GET /players.json
  def standings
    @players = Player.all

    if (params[:num_players].to_i > 2)
      @num_players = params[:num_players].to_i
    else
      @num_players = 4
    end


    @player_stats = []
    for player in @players

      rounds = Round.where(player_id: player.id)
      rounds = rounds.select{ |x| x.game.numPlay == @num_players.to_i}

      stats = getStats(player, rounds)

      if (stats != nil)
        @player_stats << stats
      end
      
      end
    end
    #@player_stats = @player_stats.sort_by{|e| -e[:wins]}
  end

  # GET /players/1
  # GET /players/1.json
  def show
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @player }
      else
        format.html { render action: 'new' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end

  private
    def getStats(player, rounds)
      if (rounds.size > 0)

        wins = rounds.select{ |x| x.place == 1}.count
        total_games = rounds.count

        max = rounds.max_by{|x| x[:score]}.score

        #num_players_q = Round.joins(:game).select("games.numPlay").where(game_id: 3, player_id: 1).first
        #num_players = num_players_q[:numPlay]

        stats = {:wins => wins,
          :total_games => total_games,
          :percentage => (wins+0.0)/total_games,
          :player_id => player.id,
          :nickname => player.nickname,
          :player => player,
          :max => max
        }

        return stats
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:firstname, :lastname, :nickname, :team)
    end
end
