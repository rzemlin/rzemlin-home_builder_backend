class Api::V1::PlansController < ApplicationController
  def index
    plans = Plan.all
    render json: PlanSerializer.new(plans)
  end

  def show
    plan = Plan.find(params[:id])
    render json: PlanSerializer.new(plan)
  end

  def create
    room = Room.find_by(id: params[:room_id])
    plan = room.plans.build(plan_params)
    if plan.save
      render json: PlanSerializer.new(plan), status: :accepted
    else
      resp = {
        error: plan.errors.full_messages.to_sentence,
      }
      render json: resp, status: :unprocessable_entity
    end
  end

  def update
    plan = Plan.find_by(id: params[:id])
    if plan.update(plan_params)
      render json: PlanSerializer.new(plan)
    else
      render json: plan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
  end

  private

  def plan_params
    params.require(:plan).permit(:description, :room_id)
  end
end
