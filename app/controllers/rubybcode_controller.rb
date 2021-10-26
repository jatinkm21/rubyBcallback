class RubybcodeController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        firstvalue = params[:a].to_i
        secondvalue = params[:b].to_i
        event = params[:event]
        callback_url = params[:callback]

        if event == 'sum'
            result = {'result' => firstvalue + secondvalue}
            send_response_as_callback(callback_url, result)
        end
    end
    def send_response_as_callback(url, payload)
        request = HTTParty.post(url, :body => payload)
    end
end
