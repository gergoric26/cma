class MeetingsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
    @contact = Contact.find(params[:contact_id])
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @contact = Contact.find(params[:contact_id])
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
    @contact = Contact.find(params[:contact_id])
  end

  # GET /meetings/1/edit
  def edit
    @contact = Contact.find(params[:contact_id])
  end

  def download
    meetingId = params[:id]
    if meetingId != nil
      docMeeting = Meeting.find(meetingId)
      fileName = docMeeting.uploadDocuments
      saveMeeting = Rails.root.join('public', 'meetingUpload', fileName)
      send_file(saveMeeting, fileName: docMeeting.uploadDocuments, type: "application/octet-sream")
    end
  end

  # POST /meetings
  # POST /meetings.json
  def create
    #@meeting = @contact.meetings.new(meeting_params)
    @meeting = Meeting.new(meeting_params)
    @meeting.contact_id = params[:contact_id]
    @meeting.user_id = current_user.id
    uploadedI = params[:meeting][:docMeeting]
    if uploadedI != nil
    fileName = uploadedI.original_filename
    saveMeeting = Rails.root.join('public', 'meetingUpload', fileName)
    File.open(saveMeeting, 'wb') do |f|
      f.write(uploadedI.read)
      end
    @meeting.uploadDocuments = fileName
    end 
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to contact_meetings_path, notice: 'Meeting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @meeting }
      else
        format.html { render action: 'new' }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to contact_meetings_path, notice: 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to contact_meetings_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:purpose, :attendance, :timeAndDate, :location, :notes, :uploadDocuments)
    end
end
