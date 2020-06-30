# frozen_string_literal: true
#
# The ContactHelper.
# TODO: This information is going to be moved into a table.
#
module ContactHelper

  def email_info
      {
        "ptos382": {
          'label': 'PtoS382@gmail.com',
          'value': 'PtoS382@gmail.com',
          'description': "A mailto link to Pat Schreiber\'s email address."
        }
      }
  end

  def social_info
    {
      'instagram': {
        'label': 'Instagram',
        'value': 'https://www.instagram.com/patschreiber',
        'description': "A link to Pat Schreiber's Instagram account."
      },
      'linkedin': {
        'label': 'LinkedIn',
        'value': 'https://www.linkedin.com/in/most-likely-patrick-schreiber/',
        'description': "A link to Pat Schreiber's LinkedIn account."
      },
      'twitter': {
        'label': 'Twitter ',
        'value': 'https://twitter.com/patschreiber',
        'description': "A link to Pat Schreiber's Twitter account."
      }
    }
  end
end
