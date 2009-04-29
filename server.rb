bp_require 'rack/webrick'

class Server
  def initialize(args)
  end
  
  def run(bp, args)
    app = proc {|env| 
     args['callback'].invoke(env) 
    }
    port = (args['port'] || 0)
    Rack::Handler::WEBrick.run(app, :Port => port)
    bp.complete(true)
  rescue Errno::EADDRINUSE => e
    bp.error('addrInUse', 'Address is in use');
  end
end

# http://browserplus.yahoo.com/developer/services/ruby/
rubyCoreletDefinition = {
  'class' => "Server",
  'name' => "Server",
  'major_version' => 1,
  'minor_version' => 0,
  'micro_version' => 8,
  'documentation' => 'A todo service that tests callbacks from ruby.',
  'functions' =>
  [
    {
      'name' => 'run',
      'documentation' => "Sayt todo \"hello\" to the world",
      'arguments' =>
      [
        {
          'name' => 'callback',
          'type' => 'callback',
          'required' => true,
          'documentation' => 'the callback to send a hello message to'
        },
        {
          'name' => 'port',
          'type' => 'integer',
          'required' => false,
          'documentation' => 'the callback to send a hello message to'
        }
      ]
    }
  ] 
}