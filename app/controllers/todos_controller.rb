class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo successfully created."
      redirect_to todo_path(@todo)
    else
      render "new"
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
  end

  def index
    @todos = Todo.all
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      redirect_to "/todos", @todos => Todo.all
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
end
