class Api::V1::ToDosController < ApplicationController
  def index
    todos = Plan.find_by(id: params[:id]).todos
    render json: todos
  end

  def show
    todo = ToDo.find(params[:id])
    render json: todo
  end

  def create
    plan = Plan.find_by(id: params[:plan_id])
    todo = plan.todo.build(todo_params)
    if todo.save
      render json: todo, status: :accepted
    else
      resp = {
        error: todo.errors.full_messages.to_sentence,
      }
      render json: todo, status: :unprocessable_entity
    end
  end

  def update
    todo = ToDo.find_by(id: params[:id])
    if todo.update(todo_params)
      render json: todo
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    todo = ToDo.find(params[:id])
    todo.destroy
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :plan_id)
  end
end
