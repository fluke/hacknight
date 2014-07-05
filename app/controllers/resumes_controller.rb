class ResumesController < ApplicationController
  before_action :check_user, except: [:new, :create, :show, :random_json]
  before_action :set_resume, only: [:print, :show, :edit, :update, :destroy, :printcard, :qcard, :qcard_step2]


  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = Resume.all
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
  require 'digest/md5'
# get the email from URL-parameters or what have you and make lowercase
email_address = @resume.email.downcase
# create the md5 hash
hash = Digest::MD5.hexdigest(email_address)
@gravatar = "http://www.gravatar.com/avatar/#{hash}"
    render layout: "resume1"
 #@resume.view_count ++
  end

  def docspad
  end
  
  def qcard
  end
  
  def random_json
    url = "http://vibeapp.co/api/v1/initial_data/?api_key=ed9e62508ef88173d937a1e2284cce50&email=mercurialmercenary@gmail.com"
    resp = ::Net::HTTP.get_response(URI.parse(url))
    data = resp.body
    @n = JSON.parse(data)
  end

  def qcard_step2
    @theme = params[:theme]
    @qr = "https://chart.googleapis.com/chart?cht=qr&chl=http://localhost:3000/resumes/" + "#{@resume.id}" + "&choe=UTF-8&chs=128x128"
  end
  
  def printcard
    @qr = "https://chart.googleapis.com/chart?cht=qr&chl=http://localhost:3000/resumes/" + "#{@resume.id}" + "&choe=UTF-8&chs=128x128"
    render :layout => false
  end
  # GET /resumes/new
  def new
    @resume = Resume.new
    @resume.user = current_user

    email_address = @resume.email.downcase
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    @gravatar = "http://www.gravatar.com/avatar/#{hash}"
    
    url = "http://vibeapp.co/api/v1/initial_data/?api_key=ed9e62508ef88173d937a1e2284cce50&email=#{current_user.email}"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body
    @vibe = JSON.parse(data)
    @name = @vibe["name"] || nil
    @bio =  @vibe["bio"] || nil
    @social = @vibe["social_profiles"] || nil
    @website = @vibe["websites"][0]["url"] if @vibe["websites"]
    @social.each do |hash|
      case hash["typeId"]
      when "twitter"
        @twitter = hash["username"]
        @bio = hash["bio"]
      when "facebook"
        @facebook = hash["url"].split('/').last
      when "linkedin"
        @linkedin = hash["url"]
      end
    end
  end

  def print
    render :layout => false
  end

  # GET /resumes/1/edit
  def edit
    email_address = @resume.email.downcase
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)
    @gravatar = "http://www.gravatar.com/avatar/#{hash}"
    url = "http://vibeapp.co/api/v1/initial_data/?api_key=ed9e62508ef88173d937a1e2284cce50&email=#{current_user.email}"
    resp = Net::HTTP.get_response(URI.parse(url))
    data = resp.body
    @vibe = JSON.parse(data)
    @name = @vibe["name"]
    @bio =  @vibe["bio"]
    @social = @vibe["social_profiles"]
    @website = @vibe["websites"][0]["url"]
    @social.each do |hash|
      case hash["typeId"]
      when "twitter"
        @twitter = hash["username"]
        @bio = hash["bio"]
      when "facebook"
        @facebook = hash["url"].split('/').last
      when "linkedin"
        @linkedin = hash["url"]
      end
    end
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = Resume.new(resume_params)
    @resume.user = current_user
    @resume.view_count = 0

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resume }
      else
        format.html { render action: 'new' }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url }
      format.json { head :no_content }
    end
  end

  private
    def check_user
      if @resume = current_user.resume
      else
        flash[:notice] = "This is not yours."
        redirect_to root_path and return
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:first_name, :middle_name, :last_name, :email, :phone, :website, :theme, :url, :view_count, educations_attributes: [:id, :college, :degree, :start_duration, :end_duration, :description, :_destroy], references_attributes: [:id, :first_name, :middle_name, :last_name, :linked_in_url, :twitter_url, :description, :_destroy], skills_attributes: [:id, :description, :_destroy], work_experiences_attributes: [:id, :company, :position, :start_duration, :end_duration, :description, :_destroy], extra_fields_attributes: [:id, :field_name, :_destroy])
    end
end
