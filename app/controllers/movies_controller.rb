class MoviesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create

    @movie = Movie.new(movie_params)
    @movie.user = User.find_by_email(params[:user][:email]) if params[:user][:email]

    if @movie.save
      render json: @movie, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  private
    def movie_params
      params[:movie].permit(:movie_id, :expected_release)
    end
end
