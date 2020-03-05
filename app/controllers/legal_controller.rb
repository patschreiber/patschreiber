# frozen_string_literal: true

#
# The LegalController.
# Defines the Terms of Use, Privacy Policy, and other legal documentation.
#
class LegalController < ApplicationController
  def terms; end

  def privacy_policy; end

  #
  # Static route for the yarn-generated vendor licenses.
  #
  def third_party_licenses
    @license_file = File.read(Rails.root.join('public/VENDOR-LICENSES'))
  end
end
