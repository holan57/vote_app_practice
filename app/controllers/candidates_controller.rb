class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:edit, :update, :destroy, :vote]
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidates_path, notice: "新增成功喔~~"
    else
      render :new, notice: "會不會用??? 顆顆..."
    end
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to candidates_path, notice: "更新成功喔~~"
    else
      render :new, notice: "會不會用??? 顆顆..."
    end
  end

  def destroy
    @candidate.destroy if @candidate
      redirect_to candidates_path, notice: "刪除囉~"
  end

  def vote
    @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
    redirect_to candidates_path, notice: "投票完成!"
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end
