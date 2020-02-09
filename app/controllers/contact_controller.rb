# frozen_string_literal: true

#
# The ContactController.
# Defines the available contact methods for Patrick.
#
class ContactController < ApplicationController
  def index
    # Let's assume Patrick's always going to be first.
    # TODO: Change to current_user.id when the time comes.
    @socials = Contact.find(1).social_accounts.contacts_list.viewable.grouped.ordered

    return unless @socials.empty?

    flash.now.notice = 'No contact info found.'
  end
end
