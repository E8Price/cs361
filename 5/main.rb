class LaunchDiscussionWorkflow
  def initialize(discussion, host, participants_email_string)
    @discussion = discussion
    @host = host
    @participants_email_string = participants_email_string
    @participants = []
  end

  def run
    return unless valid?
    run_callbacks(:create) do
      ActiveRecord::Base.transaction do
        save_discussion_and_create_roles
      end
    end
  end

  def generate_participant_users_from_email_string
    return if @participants_email_string.to_s.strip.empty?
    @participants = parse_unique_emails.map do |email|
      User.create(email: email, password: Devise.friendly_token)
    end
  end

  private


  def parse_unique_emails
    @participants_email_string.split.uniq.map(&:downcase)
  end

 
  def save_discussion_and_create_roles
    @discussion.save!
    create_discussion_roles!
    @successful = true
  end

  def valid?
    @discussion.present? && @host.present? && @participants.any?
  end
end


discussion = Discussion.new(title: "fake", ...) 
host = User.find(42)
participants = "fake1@example.com\nfake2@example.com\nfake3@example.com"

workflow = LaunchDiscussionWorkflow.new(discussion, host, participants)
workflow.generate_participant_users_from_email_string
workflow.run
