class LinebotController < ApplicationController
  require 'line/bot'  
  
  protect_from_forgery :except => [:callback]

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["0bbed4e87f4a1d4734aa717f28530cb8"]
      config.channel_token = ENV["ZpJWN1tW7hS+C+EsaS0/qd8vBn0pkqgVfyZRLROmI/hyOwbF/zCtv+FWmTWZWgIbQmwMOjnpuhW9YpEOy2RoQMl5m41PVyJxUZM+/BugNHoxfA0K6fxHqSIKQApzjuhCP1bUuJGGEKsaWdTjBptb0wdB04t89/1O/w1cDnyilFU="]
    }
  end

  def callback

    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end

    events = client.parse_events_from(body)

    events.each { |event|

      if event.message['text'].include?("ひろむ")
        response = "
        パスワードの確認は１を
        "
      else
        response = "名前を入力してください"
      end


      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = {
            type: 'text',
            text: response
          }
          client.reply_message(event['replyToken'], message)
        end
      end
    }

    head :ok
  end
end
