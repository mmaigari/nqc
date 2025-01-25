class ParticipantsController < ApplicationController
  before_action :set_participant, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:new, :create]

  # GET /participants or /participants.json
  def index
    @participants = Participant.all
    
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="participants.xlsx"'
      }
    end
  end

  # GET /participants/1 or /participants/1.json
  def show
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants or /participants.json
  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      flash[:success] = "Registration successful!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /participants/1 or /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: "Participant was successfully updated." }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1 or /participants/1.json
  def destroy
    @participant.destroy!

    respond_to do |format|
      format.html { redirect_to participants_path, status: :see_other, notice: "Participant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def participant_params
      params.require(:participant).permit(
        :first_name, :middle_name, :surname, :gender, 
        :marital_status, :date_of_birth, :state, :lga,
        :email_address, :phone_number, :home_address,
        :bank_name, :account_name, :account_number,
        :ticket_type, :year_of_musabaqa, :ward
      )
    end
end
