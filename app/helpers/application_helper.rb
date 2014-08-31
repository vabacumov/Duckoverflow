module ApplicationHelper
  # # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def score_of_votes(object)
    counter = 0
    object.votes.each do |vote|
      if vote.upvote == true
        counter += 1
      else
        counter -= 1
      end
    end
    counter
  end
end
