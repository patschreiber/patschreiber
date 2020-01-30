# frozen_string_literal: true

#
# The ApplicationHelper.
# Methods contained within the ApplicationHelper will be available app-wide.
#
module ApplicationHelper
  def copyright
    "© #{DateTime.now.strftime('%Y')} Patrick Schreiber"
  end

  def current_year
    DateTime.now.strftime('%Y')
  end

  def twitter_url
    'https://twitter.com/patschreiber'
  end

  def github_url
    'https://github.com/patschreiber'
  end

  def linkedin_url
    'http://www.linkedin.com/pub/patrick-schreiber/2a/85/833/'
  end

  def instagram_url
    'https://www.instagram.com/patschreiber'
  end

  def soundcloud_url
    'https://soundcloud.com/shakewel'
  end

  def spotify_url
    'https://open.spotify.com/user/patschreiber'
  end

  def mail_address
    'ptos382@gmail.com'
  end
end
