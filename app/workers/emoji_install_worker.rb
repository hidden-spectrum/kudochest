class EmojiInstallWorker
  include Sidekiq::Worker

  def perform(team_rid)
    team = Team.find_by!(rid: team_rid)
    Discord::EmojiInstallService.call(team:)
  end
end
