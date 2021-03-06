# frozen_string_literal: true

require 'open-uri'

class ImageProxyController < ApplicationController
  def show
    expires_in(2.years, public: true)

    requested_image_url = Base64.decode64(CGI.unescape(params[:requested_image_url]))

    data = URI.open(requested_image_url).read

    send_data data, type: 'image/jpeg', disposition: nil
  end
end
