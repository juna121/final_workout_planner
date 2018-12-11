class BodypartsController < ApplicationController
  def index
    @bodyparts = Bodypart.all

    render("bodypart_templates/index.html.erb")
  end

  def show
    @bodypart = Bodypart.find(params.fetch("id_to_display"))

    render("bodypart_templates/show.html.erb")
  end

  def new_form
    @bodypart = Bodypart.new

    render("bodypart_templates/new_form.html.erb")
  end

  def create_row
    @bodypart = Bodypart.new

    @bodypart.name = params.fetch("name")

    if @bodypart.valid?
      @bodypart.save

      redirect_back(:fallback_location => "/bodyparts", :notice => "Bodypart created successfully.")
    else
      render("bodypart_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @bodypart = Bodypart.find(params.fetch("prefill_with_id"))

    render("bodypart_templates/edit_form.html.erb")
  end

  def update_row
    @bodypart = Bodypart.find(params.fetch("id_to_modify"))

    @bodypart.name = params.fetch("name")

    if @bodypart.valid?
      @bodypart.save

      redirect_to("/bodyparts/#{@bodypart.id}", :notice => "Bodypart updated successfully.")
    else
      render("bodypart_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @bodypart = Bodypart.find(params.fetch("id_to_remove"))

    @bodypart.destroy

    redirect_to("/bodyparts", :notice => "Bodypart deleted successfully.")
  end
end
