class Api::HabitsController < ApplicationController
  before_action :set_habit, only: [:show, :update, :destroy, :mark_done]

  def index
    habits = Habit.all
    render json: habits
  end

  def show
    render json: @habit
  end

  def create
    habit = Habit.new(habit_params)
    if habit.save
      render json: habit, status: :created
    else
      render json: { errors: habit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @habit.update(habit_params)
      render json: @habit
    else
      render json: { errors: @habit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @habit.destroy
    head :no_content
  end

  def mark_done
    today = Date.today.to_s
    @habit.done_today = true
    @habit.completed_dates ||= []
    @habit.completed_dates << today unless @habit.completed_dates.include?(today)

    if @habit.save
      render json: @habit
    else
      render json: { errors: @habit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_habit
    @habit = Habit.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Habit not found' }, status: :not_found
  end

  def habit_params
    params.require(:habit).permit(:name, :done_today, completed_dates: [])
  end
end
