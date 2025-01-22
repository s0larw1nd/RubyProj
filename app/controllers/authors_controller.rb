class AuthorsController < ApplicationController
  before_action :set_author, only: %i[ show edit update destroy ]

  def index
    @authors = Author.all
  end

  def show
    @books = Book.where(author_id: @author.id)
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author, notice: "Author was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      redirect_to @author
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy!

    redirect_to authors_path
  end

  private
    def set_author
      @author = Author.find(params.expect(:id))
    end

    def author_params
      params.expect(author: [ :first_name, :last_name, :patronymics, :birthdate, :deathdate, :nationality, :genre_id, :photo ])
    end
end
