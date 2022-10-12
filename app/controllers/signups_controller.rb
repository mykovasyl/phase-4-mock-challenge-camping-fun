class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    new_signup = Signup.create!(signup_params)
    render json: new_signup.activity, status: :created
  end

  private

  def signup_params
    params.permit(:camper_id, :activity_id, :time)
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
