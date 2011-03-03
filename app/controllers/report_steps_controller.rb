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
  end

  # PUT /report_steps/1
  # PUT /report_steps/1.xml
  def update
    @report_step = ReportStep.find(params[:id])

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