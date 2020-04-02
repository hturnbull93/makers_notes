# NAME OF WORKSHOP - Skills Workshop

[All Workshops](README.md) | [Source]( )

Learning Objectives

- [ ] Demonstrate that Rack provides a library to wrap HTTP requests in ruby objects
- [ ] Solve bugs in a simple rack application
- [ ] Describe how rack utilises polymorphism to pass a request through multiple layers of middleware

Achievement Plan

- [ ] AP

Evidence

- Evidence 1

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

### Exercise 1

In ruby hello_world.rb:

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

### Exercise 2

In ruby hello_world.rb:

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

### Exercise 3

In hello_world.rb:

```ruby
class HelloWorldApp
  def self.call(env)
    # view the env hash
    # pp env 
    [200, {}, ["Hello #{env['QUERY_STRING']}, your address is #{env['REMOTE_ADDR']}"]]
  end
end
```

This interpolates the values of some of the env hash keys into the body.