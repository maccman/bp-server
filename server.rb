class Server < ::WEBrick::HTTPServlet::AbstractServlet
  def initialize(args)
  end
  
  def initialize(server, app)
    super server
    @app = app
  end
  
  def run
    server = ::WEBrick::HTTPServer.new()
    server.mount "/", Rack::Handler::WEBrick, app
    trap(:INT) { server.shutdown }
    server.start
  end
end

# http://browserplus.yahoo.com/developer/services/ruby/
rubyCoreletDefinition = {
  'class' => "Server",
  'name' => "Server",
  'major_version' => 1,
  'minor_version' => 0,
  'micro_version' => 5,
  'documentation' => 'A todo service that tests callbacks from ruby.',
  'functions' =>
  [
    {
      'name' => 'browse',
      'documentation' => "Sayt todo \"hello\" to the world",
      'arguments' =>
      [
        {
          'name' => 'service',
          'type' => 'string',
          'required' => true,
          'documentation' => 'the callback to send a hello message to'
        },
        {
          'name' => 'callback',
          'type' => 'callback',
          'required' => true,
          'documentation' => 'the callback to send a hello message to'
        },
        {
          'name' => 'timeout',
          'type' => 'integer',
          'required' => false,
          'documentation' => 'the callback to send a hello message to'
        }
      ]
    },
    {
      'name' => 'register',
      'documentation' => "todo",
      'arguments' => 
      [
        {
          'name' => 'name',
          'type' => 'string',
          'required' => true,
          'documentation' => 'todo'
        },
        {
          'name' => 'service',
          'type' => 'string',
          'required' => true,
          'documentation' => 'todo'
        },
        {
          'name' => 'port',
          'type' => 'integer',
          'required' => true,
          'documentation' => 'todo'
        }
      ]
    }
  ] 
}