class ReportStepsController < ApplicationController

  # GET /report_steps
  # GET /report_steps.xml
  def index
    ((Step.all.map &:id) - (ReportStep.all.map &:step_id)).each do |step_id|
      Step.find(step_id).report_steps.build(:submitted => false).save
    end

    @report_steps = ReportStep.all
    @title = "Report Steps"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @report_steps }
    end
  end

  # GET /report_steps/1
  # GET /report_steps/1.xml
  def show
    @report_step = ReportStep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report_step }
    end
  end

  # GET /report_steps/1/edit
  def edit
    @report_step = ReportStep.find(params[:id])
    @report_step.initialize_report_step

    @entities = @report_step.entities.order('last_name ASC, first_name ASC')
    @entity = Entity.find(params[:entity_id]) if params[:entity_id]
    @entity ||= @entities.first
    @next_entity = @entities.where('last_name > ? OR (last_name = ? and first_name > ?)', @entity.last_name, @entity.last_name, @entity.first_name).order('last_name ASC, first_name ASC').first
    @prev_entity = @entities.where('last_name < ? OR (last_name = ? and first_name < ?)', @entity.last_name, @entity.last_name, @entity.first_name).order('last_name DESC, first_name DESC').first

    @title = @report_step.step
    @questions = @report_step.step.questions.order('display_order ASC')
    @answers = @questions.map { |question| @entity.answers.find_or_initialize_by_question_id(question.id) }

    render :edit, :layout => 'sidebar'
  end

  # PUT /report_steps/1
  # PUT /report_steps/1.xml
  def update
    @report_step = ReportStep.find(params[:id])
    @entity = Entity.find(params[:entity][:id])

    params[:entity][:answers_attributes].each do |question_id, fields|
      answer = @entity.answers.find_or_create_by_question_id(question_id)
      answer.data = fields[:data]
      answer.not_applicable = false
      answer.save
    end

    respond_to do |format|
      if @report_step.update_attributes(params[:report_step])
        format.html { redirect_to(@report_step, :notice => 'Report step was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report_step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /report_steps/1
  # DELETE /report_steps/1.xml
  def destroy
    @report_step = ReportStep.find(params[:id])
    @report_step.destroy

    respond_to do |format|
      format.html { redirect_to(report_steps_url) }
      format.xml  { head :ok }
    end
  end
end
