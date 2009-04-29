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
  'micro_version' => 9,
  'documentation' => 'A Rack server service.',
  'functions' =>
  [
    {
      'name' => 'run',
      'documentation' => "Start the server",
      'arguments' =>
      [
        {
          'name' => 'callback',
          'type' => 'callback',
          'required' => true,
          'documentation' => 'The callback for requests'
        },
        {
          'name' => 'port',
          'type' => 'integer',
          'required' => false,
          'documentation' => 'Server port'
        }
      ]
    }
  ] 
}