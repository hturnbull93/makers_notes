# Servers 2 - Skills Workshop

[All Workshops](README.md) | [Source]()

Learning Objectives

- [x] Learn about HTTP servers by playing with a toy one

Achievement Plan

- [x] Play with some basic server code

Evidence

- I have fiddled about with the server code below and can explain it in full.

## Notes

This is a very basic server:

```ruby
require 'socket'

def run_server
  server = TCPServer.new(2345)

  loop do
    # Waiting for a connection to be made
    socket = server.accept

    # Capture the received request and display it to the server terminal
    request = get_lines_until_blank_line(socket)
    puts "=== GOT REQUEST ==="
    puts request
    puts "=== END REQUEST ==="

    # Based on the first line of the request, decide what to respond with
    # Visiting http://localhost:2345
    if request.start_with? "GET / HTTP/1.1"
      response = "Hello World!\n"
    # Visiting http://localhost:2345/secret-page
    elsif request.start_with? "GET /secret_page HTTP/1.1"
      response = "1. The gold is buried at harald creek\n"
      response += "2. OK I only have one secret"
    else
    # Visiting anything else, such as http://localhost:2345/no-route-here
      response = "Nothing found :("
    end

    # Set up the http response
    http_response = build_http_response(response)
    socket.print http_response

    # Display the http response to the server terminal
    puts "=== SENT RESPONSE ==="
    puts http_response
    puts "=== END RESPONSE ==="
    puts "\n"

    # Now the response has been sent, the connection is closed
    socket.close
  end
end

# Reads each line of the socket request and adds it to the message until an empty line
def get_lines_until_blank_line(socket)
  message = ""
  loop do
    line = socket.gets
    if line.chomp == ""
      break
    else
      message += line
    end
  end
  message
end

# Incorporates the response into a http response that can be understood by the client
def build_http_response(response)
  message = "HTTP/1.1 200 OK\r\n" +
    "Content-Type: text/plain\r\n" +
    "Content-Length: #{response.bytesize}\r\n" +
    "Connection: close\r\n" +
    "\r\n" +
    response
end

run_server
```

This very basic server does the following:

- Opens at <http://localhost:2345>
- Waits for a client to connect (server.accept)
- Captures inbound request
- Print it to the server's terminal
- Decides what to respond with based on the request's GET route:
  - "Hello World!" for "/"
  - Some secrets for "/secret-page"
  - "Nothing found :(" in any other case
- Sends the response back to the client
- Prints it to the terminal also
- Closes the connection, loops back and waits for the next connection
