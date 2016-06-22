class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    #@movies = Movie.all
    @query = nil
    @gValues = Tmdb::Genre.movie_list
    @input = params[:user_input]

    if(params[:user_input] != "" && @input != nil) 
      @query = Tmdb::Search.movie(@input).results
    elsif (params[:sort] == "1")
      @input = params[:q]
      @query = Tmdb::Search.movie(@input).results.sort_by{|h| h['title']}
      if (params[:pivot] == "tf")
         @query = Tmdb::Search.movie(@input).results.sort_by{|h| h['title']}.reverse!
         @lpivot = "tb"
      else
         @lpivot = "tf"
      end
    elsif (params[:sort] == "2")
      @input = params[:q]
      @query = Tmdb::Search.movie(@input).results.sort_by{|h| h['release_date']}
      if (params[:pivot] == "tf")
         @query = Tmdb::Search.movie(@input).results.sort_by{|h| h['release_date']}.reverse!
         @lpivot = "tb"
      else
         @lpivot = "tf"
      end
    elsif (params[:sort] == "3")
      @input = params[:q]
      @query = Tmdb::Search.movie(@input).results.sort_by{|h| h['genre_ids']}
      if (params[:pivot] == "tf")
         @query = Tmdb::Search.movie(@input).results.sort_by{|h| h['genre_ids']}.reverse!
         @lpivot = "tb"
      else
         @lpivot = "tf"
      end
    end

  end

  def viewMovie   #pratically a show
    @title = params[:title]
    @overview = params[:overview]
    @id = params[:id]
    @rdb = Rating.all
    @rating = Rating.new
    @user = User.all
  end
  def sort
    @query = params[:q]
    @gValues = Tmdb::Genre.movie_list
    
  end
  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      #@movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.fetch(:movie,:mv, {})
    end
end
