class CallsController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :xml

  def create
    call = Call.create!({
      direction: params['Direction'],
      from: params['From'],
      caller_name: params['To'],
      to: params['To'],
      status: params['CallStatus'],
      uuid: params['CallUUID']
    })
    apps = UserNumber.all

    response = Plivo::Response.new do |r|
      r.Dial({
        callerId: call.from,
        callbackUrl: calls_update_url,
        action: calls_complete_url,
        timeout: 15
      }) do |d|
        apps.each { |app| d.User(app.sip_endpoint) }
      end
    end

    render xml: response.to_xml
  end

  def update
    if params['DialAction'] == 'answer'
      @call = Call.find_by!(uuid: params['CallUUID'])
      @call.answering_number = UserNumber.find_by!(sip_endpoint: params['DialBLegTo'])
      @call.save!
    end

    render xml: Plivo::Response.new.to_xml
  end

  def complete
    @call = Call.find_by!(uuid: params['DialALegUUID'])
    @call.status = params['DialStatus']
    @call.save!

    # Redirect to voicemail if no response
    if @call.status == 'no-answer'
      response = Plivo::Response.new do |r|
        r.Speak('You have reached an automatic voicemail system. Please leave a message after the tone.')
        r.Record({action: calls_complete_voicemail_url})
      end

      render xml: response.to_xml and return
    end

    render xml: Plivo::Response.new.to_xml
  end

  def complete_voicemail
    @call = Call.find_by!(uuid: params['CallUUID'])
    @call.voicemail_url = params['RecordUrl']
    @call.status = params['CallStatus']
    @call.save!

    render xml: Plivo::Response.new.to_xml
  end
end
