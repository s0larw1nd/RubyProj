class GenresController < ApplicationController
  before_action :set_genre, only: %i[ show edit update destroy ]

  def index
    @genres = Genre.all
  end

  def show
    @books = Book.where(genre_id: @genre.id)
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to @genre, notice: "Genre was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @genre.update(genre_params)
      redirect_to @genre
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @genre.destroy
    redirect_to genres_path
  end

  private
    def set_genre
      @genre = Genre.find(params.expect(:id))
    end

    def genre_params
      params.expect(genre: [ :genre_name, :description ])
    end
end
