# NAME OF WORKSHOP - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/blob/master/practicals/servers_and_clients/clients.md)

Learning Objectives

- [x] Learn about how servers and clients interact by playing with simple clients and servers.

Achievement Plan

- [x] Play with some simple clients and servers, get them to do what I want.

Evidence

- Evidence 1

## Notes

### Rude Server and Sarcastic Client

Rude Server is rudely asking for the clients name in allcaps:

```ruby
require 'socket'

# Open the server at port 2345
server = TCPServer.new(2345)

# Wait for connection
socket = server.accept

# Loop forever, sleeps are to slow it down
loop do
  # 1. putsing to the socket (the client's STDout)
  socket.puts "HELLO CLIENT WHAT IS YOUR NAME?"
  sleep 1
  # Waiting for a name to be entered into the socket from the client's end
  name = socket.gets.chomp
  sleep 1
  # puts to its own STDout, not to the socket
  puts "HMMM, THEIR NAME IS #{name.upcase}, I WILL COMPLIMENT THIS NAME"
  sleep 1
  # Repeating the name back to the client's STDout
  socket.puts "THAT'S A LOVELY NAME #{name.upcase}"
  sleep 1
end

socket.close
```

Client is sarcastically giving random names from an array:

```ruby
require 'socket'

# Set up a connection to localhost 2345
socket = TCPSocket.new('localhost', 2345)

names = %w[Chris Steve Ryan Andrew Liz Sarah Patsy Celine]

# Loop forever, sleeps are to slow it down
loop do
  # Each loop choose a new name
  name = names.sample
  # Waits for input from the server: "HELLO CLIENT WHAT IS YOUR NAME?", and puts to STDout
  puts socket.gets
  sleep 1
  # puts to its own STDout, not to the socket
  puts "Wow what a rude server... I'm going to say #{name}"
  socket.puts "#{name}"
  # Waits for input from the server: "THAT IS A LOVELY NAME ...", and puts to STDout
  puts socket.gets
end

socket.close
```
