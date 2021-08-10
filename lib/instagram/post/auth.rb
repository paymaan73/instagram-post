# frozen_string_literal: true
require 'instagram/post/link'
require 'instagram/post/scope'
require 'instagram/post/config'
require 'httparty'
module Instagram
  module Post
  # GET Auth Link Facebook
    class Auth
      class NotFoundConfigFile < StandardError; end
      class ForceUseRails < StandardError; end
    def call(config)
      begin
        link          = "#{Instagram::Post::LINK}client_id=#{config[:client_id]}&redirect_uri=#{config[:redirect_uri]}&scope=#{config[:scope]}"
      rescue
        NotFoundConfigFile.new('Please set config file in initialize path.')
      end
    end


    def self.link(config)
      new.call(config)
    end
  end

 end
end
