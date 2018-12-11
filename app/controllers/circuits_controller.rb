class CircuitsController < ApplicationController
  def index
    @q = Circuit.ransack(params[:q])
    @circuits = @q.result(:distinct => true).includes(:workout, :exercise).page(params[:page]).per(10)

    render("circuit_templates/index.html.erb")
  end

  def show
    @circuit = Circuit.find(params.fetch("id_to_display"))

    render("circuit_templates/show.html.erb")
  end

  def new_form
    @circuit = Circuit.new

    render("circuit_templates/new_form.html.erb")
  end

  def create_row
    @circuit = Circuit.new

    @circuit.workout_id = params.fetch("workout_id")
    @circuit.exercise_id = params.fetch("exercise_id")
    @circuit.reps = params.fetch("reps")
    @circuit.sets = params.fetch("sets")
    @circuit.weight = params.fetch("weight")
    @circuit.unit = params.fetch("unit")
    @circuit.note = params.fetch("note")

    if @circuit.valid?
      @circuit.save

      redirect_back(:fallback_location => "/circuits", :notice => "Circuit created successfully.")
    else
      render("circuit_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_workout
    @circuit = Circuit.new

    @circuit.workout_id = params.fetch("workout_id")
    @circuit.exercise_id = params.fetch("exercise_id")
    @circuit.reps = params.fetch("reps")
    @circuit.sets = params.fetch("sets")
    @circuit.weight = params.fetch("weight")
    @circuit.unit = params.fetch("unit")
    @circuit.note = params.fetch("note")

    if @circuit.valid?
      @circuit.save

      redirect_to("/workouts/#{@circuit.workout_id}", notice: "Circuit created successfully.")
    else
      render("circuit_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_exercise
    @circuit = Circuit.new

    @circuit.workout_id = params.fetch("workout_id")
    @circuit.exercise_id = params.fetch("exercise_id")
    @circuit.reps = params.fetch("reps")
    @circuit.sets = params.fetch("sets")
    @circuit.weight = params.fetch("weight")
    @circuit.unit = params.fetch("unit")
    @circuit.note = params.fetch("note")

    if @circuit.valid?
      @circuit.save

      redirect_to("/exercises/#{@circuit.exercise_id}", notice: "Circuit created successfully.")
    else
      render("circuit_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @circuit = Circuit.find(params.fetch("prefill_with_id"))

    render("circuit_templates/edit_form.html.erb")
  end

  def update_row
    @circuit = Circuit.find(params.fetch("id_to_modify"))

    @circuit.workout_id = params.fetch("workout_id")
    @circuit.exercise_id = params.fetch("exercise_id")
    @circuit.reps = params.fetch("reps")
    @circuit.sets = params.fetch("sets")
    @circuit.weight = params.fetch("weight")
    @circuit.unit = params.fetch("unit")
    @circuit.note = params.fetch("note")

    if @circuit.valid?
      @circuit.save

      redirect_to("/circuits/#{@circuit.id}", :notice => "Circuit updated successfully.")
    else
      render("circuit_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_workout
    @circuit = Circuit.find(params.fetch("id_to_remove"))

    @circuit.destroy

    redirect_to("/workouts/#{@circuit.workout_id}", notice: "Circuit deleted successfully.")
  end

  def destroy_row_from_exercise
    @circuit = Circuit.find(params.fetch("id_to_remove"))

    @circuit.destroy

    redirect_to("/exercises/#{@circuit.exercise_id}", notice: "Circuit deleted successfully.")
  end

  def destroy_row
    @circuit = Circuit.find(params.fetch("id_to_remove"))

    @circuit.destroy

    redirect_to("/circuits", :notice => "Circuit deleted successfully.")
  end
end
