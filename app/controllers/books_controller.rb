class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @authors = Author.all
    @genres = Genre.all
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy!

    redirect_to books_path
  end

  def read
    @book = Book.find(params[:id])
    if @book.pdf_file.attached?
      pdf_content = StringIO.new(@book.pdf_file.download)
      reader = PDF::Reader.new(pdf_content)
      @pdf_text = reader.pages.map(&:text).join("\n")
    else
      @pdf_text = "No PDF attached"
    end
  end

  private
  def set_book
    @book = Book.find(params.expect(:id))
  end

  def book_params
    params.require(:book).permit(:title, :description, :author_id, :genre_id, :publication_year, :isbn, :pdf_file, :cover)
    # params.expect(book: [ :title, :description, :author_id, :genre_id, :publication_year, :isbn, :pdf_file, :cover ])
  end

  def extract_text_from_pdf(file)
    reader = PDF::Reader.new(file)
    reader.pages.map(&:text).join("\n")
  end
end
