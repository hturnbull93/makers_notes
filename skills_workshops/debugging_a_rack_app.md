# NAME OF WORKSHOP - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/tree/master/week-3/dissecting-rack-middleware)

Learning Objectives

- [x] Demonstrate that Rack provides a library to wrap HTTP requests in ruby objects
- [x] Solve bugs in a simple rack application
- [x] Describe how rack utilises polymorphism to pass a request through multiple layers of middleware

Achievement Plan

- [x] Debug some simple Rack stacks to gain an understanding.

Evidence

- I have debugged a series of [Rack Stacks](https://github.com/hturnbull93/skills-workshops/tree/master/week-3/dissecting-rack-middleware).

## Notes

### Remember the Mantra

- Tighten the loop

- Get visibility

- Single fix

### Rack

Rack is a library that provides a simplified interface between your ruby application and your server.

Rack classes must respond to call taking a single argument env.

Rack classes must return an array of three things:

- HTTP status code
- Headers
- Body

### Config.ru

A config.ru file in the main directory can contain instructions for the rack stack.

Running `rackup` will launch the server with Rack following config.ru.

### env

env is the Envorinment, and is passed in as the only argument to a Rack class.

It is a hash, with data that can be accessed or added to. It can be viewed at any point with pretty print: `pp env`

```ruby
{"rack.version"=>[1, 3],
 "rack.input"=>#<StringIO:0x00007fe287970c40>,
 "rack.errors"=>#<StringIO:0x00007fe287970e48>,
 "rack.multithread"=>true,
 "rack.multiprocess"=>true,
 "rack.run_once"=>false,
 "REQUEST_METHOD"=>"GET",
 "SERVER_NAME"=>"example.org",
 "SERVER_PORT"=>"80",
 "QUERY_STRING"=>"",
 "PATH_INFO"=>"/",
 "rack.url_scheme"=>"http",
 "HTTPS"=>"off",
 "SCRIPT_NAME"=>"",
 "CONTENT_LENGTH"=>"0",
 "rack.test"=>true,
 "REMOTE_ADDR"=>"127.0.0.1",
 "HTTP_HOST"=>"example.org",
 "HTTP_COOKIE"=>""}
```

## Practicals

### Exercise 1 - Starting a Rack Server, Returning Status, Headers, and Body 

In hello_world.rb:

```ruby
require 'rack'
require 'rack/server'

class HelloWorldApp
  def self.call(env)
    # Return a HTTP status code, the headers, and the body
    [418, {}, ['Hello world, would you like some tea?']]
  end
end

#  Start the server
Rack::Server.start(app: HelloWorldApp)
```

Run with: 

```bash
ruby hello_world.rb
```

In hello_world_spec.rb:

```ruby
require 'spec_helper'
require 'rack/test'
require 'hello_world'

describe 'hello world' do
  include Rack::Test::Methods

  def app
    HelloWorldApp
  end

  it 'says hello' do
    get '/'
    expect(last_response.body).to eq('Hello world, would you like some tea?')
  end

  it 'is ok' do
    get '/'
    expect(last_response.status).to eq(418)
  end

end
```

The response 418 gives "I am a teapot", an april fools joke.

### Exercise 2 - config.ru

In hello_world.rb:

```ruby
class HelloWorldApp
  def self.call(env)
    [200, {}, ['Hello Exercise 2']]
  end
end

Rack::Server.start(app: HelloWorldApp)
```

Run with: 

```bash
ruby hello_world.rb
```

In hello_world_spec.rb:

```ruby
require 'spec_helper'
require 'rack/test'
require 'hello_world'

describe 'hello world' do
  include Rack::Test::Methods

  def app
    HelloWorldApp
  end

  it 'says hello' do
    get '/'
    expect(last_response.body).to eq('Hello Exercise 2')
  end

  it 'is ok' do
    get '/'
    expect(last_response.status).to eq(200)
  end

end
```

In config.ru, in the main directory:

```ruby
require './lib/hello_world'

run 'hello_world'
```

Here the server can be run from the main directory simply with:

```bash
rackup
```

The instructions that rackup follows are in config.ru

### Exercise 3 - env

In hello_world.rb:

```ruby
class HelloWorldApp
  def self.call(env)
    # View the env hash
    # pp env 
    [200, {}, ["Hello #{env['QUERY_STRING']}, your address is #{env['REMOTE_ADDR']}"]]
  end
end
```

This interpolates the values of some of the env hash keys into the body.

### Exercise 4 - Request object

Encapsulating the env in a Request instance allows it's data to be accessed much more easily via methods on the Request instance.

In hello_world.rb:

```ruby
class HelloWorldApp
  def self.call(env)
    request = Rack::Request.new(env)
    # View available methods for Request instance
    # pp request.methods.sort
    message = request.params['message'] || 'nothing!'
    # Rather than using env['PATH_INFO'] and env['REQUEST_METHOD']
    # just use request.path and request.request_method
    [200, {}, ["Hello, you sent 'message = #{message}', to #{request.path}, via #{request.request_method} request"]]
  end
end
```

In hello_world_spec.rb:

```ruby
require 'spec_helper'
require 'rack/test'
require 'hello_world'

describe 'hello world' do
  include Rack::Test::Methods

  def app
    HelloWorldApp
  end

  it 'responds to get with no params, and returns request method' do
    get '/'
    expect(last_response.body).to include('nothing!')
    expect(last_response.body).to include('via GET request')
  end

  it 'responds with post details' do
    post '/my-lovely-path?message=exercise-4'
    expect(last_response.body).to include('exercise-4')
    expect(last_response.body).to include('/my-lovely-path')
  end
end
```

### Exercise 5 - Response object

Using a Rack Response object instance helps to make preparing a response very easy.

In hello_world.rb:

```ruby
class HelloWorldApp
  def self.call(env)
    request = Rack::Request.new(env)
    message = request.params['message'] || 'nothing!'
    response_string = "Hello, you sent 'message = #{message}', to #{request.path}, via #{request.request_method} request"
    # Prepare the response as a new Rack Response instance
    response = Rack::Response.new
    # View available methods for Response instance
    # pp response.methods.sort

    # Add the response string to response body
    response.write(response_string)
    # Return the Rack response array
    response.finish
  end
end
```

### Exercise 6 - Middleware

Middleware is used as a stack for the response to pass into through to the actual app, then back up.

Each layer of middleware is initialized with an app.

The middleware class responds to call, which does something before calling call on the app it was initialized with.

In hello_world.rb:

```ruby
class HelloWorldApp
  def self.call(env)
    request = Rack::Request.new(env)
    message = request.params['message'] || 'nothing!'
    path = request.path
    request_method = request.request_method

    response_string = "Hello, you sent 'message = #{message}', to #{path}, via #{request_method} request"

    response = Rack::Response.new
    response.write(response_string)
    response.finish
  end
end

class Logger
  def initialize(app)
    @app = app
  end
  # Responds to call, but before passing down the chain, prints the request object.
  def call(env)
    request = Rack::Response.new(env)
    pp request.inspect
    @app.call(env)
  end
end

class Cacher
  def initialize(app)
    @app = app
    @storage = storage || {}
  end
  # Responds to call, but before passing down the chain, prints the request object.
  def call(env)
    store(env)
    @app.call(env)
  end

  private

  def storage
    @storage
  end
  def store(data)
    p 'storing data in cache'
    @storage = data
  end
end
```

Rather than using a complex chain of nested initialises and calls, config.ru can prepare the stack with `use`:

```ruby
require './lib/hello_world'

use Logger
use Cacher
run HelloWorldApp
```

First the request will go through the Logger, then the Cacher, then be handled by HelloWorldApp, then the response is handed up the chain.
