class Slack::ChannelJoinService < Base::Service
  option :team
  option :channel_rid

  def call
    join_channel
  end

  private

  def join_channel
    team.slack_client.conversations_join(channel: channel_rid)
  rescue Slack::Web::Api::Errors::IsArchived,
         Slack::Web::Api::Errors::MethodNotSupportedForChannelType
    false
  end
end
