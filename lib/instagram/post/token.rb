# frozen_string_literal: true
require 'instagram/post/link'
require 'instagram/post/config'
require 'httparty'
require 'addressable'
require 'redis'
module Instagram
  module Post
    TOKENLINK    = 'https://graph.facebook.com/v11.0/oauth/access_token?'
  # GET User Access Token
    class Token
      def initialize(config, request)
        @config  = config
        @request    = request
      end

      def get_access_token
        token = HTTParty.get("#{Instagram::Post::TOKENLINK}client_id=#{@config[:client_id]}&redirect_uri=#{@config[:redirect_uri]}&client_secret=#{@config[:app_secret]}&code=#{Addressable::URI.parse(@request.url).query_values['code']}")
        code = JSON.parse(token.body)["access_token"]
        user_id = HTTParty.get("https://graph.facebook.com/me?access_token=#{code}")
        user_id = JSON.parse(user_id.body)
        {token: token, id: user_id}
        #yield user_id if block_given?
        #Redis.new(local: 'localhost').setex(user_id["id"], 100000, token)
      end

      def self.get(config, request)
        new(config, request).get_access_token
      end
    end
  end
end
