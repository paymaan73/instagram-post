# frozen_string_literal: true
require "instagram/post/version"
require "instagram/post/auth"
require "instagram/post/token"
require "instagram/post/ids"
require "instagram/post/publish"
require "instagram/post/account"

class Send
  def initialize(image_url, caption, config, request)
    @image_url = image_url
    @caption  = caption
    @config = config
    @request = request
  end

  def generate_token
    Instagram::Post::Token.get_access_token(@config, request)[:token]
  end

  def post
    token = generate_token
    ids = Instagram::Post::Account.new(@config, token).generate_id(@image_url, @caption)
    ids.each do |id|
      HTTParty.post("https://graph.facebook.com/id/media_publish?access_token=#{token}",
                    :body => {
                      creation_id: id
                    }
                   )
    end
  end

  def self.post(image_url, caption, config, request)
    new(image_url, caption, config, request).post
  end
end
