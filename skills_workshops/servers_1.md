# Servers 1 - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/blob/master/practicals/servers_and_clients/servers.md)

Learning Objectives

- [x] Learn about servers by playing with a toy version

Achievement Plan

- [x] Use examples of simple servers to gain an insight as to how they work
- [x] Create a Note List hosting server

Evidence

- I have created a simple [Note List app hosting server](https://github.com/hturnbull93/note-list-server) that allows several clients to take notes simultaneously

## Notes

### Networked Applications

Networked applications involve clients, and servers.

Rather than reading lots of documentation, developers often build or find simple examples to learn about something by taking them apart.

### A Simple Server

```ruby
require 'socket'

server = TCPServer.new(2345)

socket = server.accept

socket.puts "What do you say?"

they_said = socket.gets.chomp

socket.puts "You said: #{they_said}. Goodbye!"

socket.close
```

- A TCPserver at port 2345 is created.
- `server.accept` waits for a connection to be made.
- The socket prompts for an input.
- Returns an interpolated string.
- Then closes.

Access the server with:

```bash
telnet localhost 2345
```

## Exercises

### Serving Multiple Clients

```ruby
require 'socket'

server = TCPServer.new(2345)

# Loop to start multiple threads to serve multiple clients
loop do
  Thread.start(server.accept) do |socket|
    # Loop to keep getting things to repeat
    loop do
      socket.puts "What do you say?"
      they_said = socket.gets.chomp
      if they_said == 'quit'
        socket.puts 'Quitting'
        socket.close
      else
        socket.puts "You said: #{they_said}!"
      end
    end
  end
end
```

With this server, a loop starts a threads that awaits the connection to be made. Once it is the a new connection is awaited, allowing multiple clients to connect.

Each client's socket loops through getting words to repeat back, until they say "quit" in which case the socket is closed.

One client quitting their socket simply closes the thread, and has no effect on the other clients.

Because of the loop, the server stays running, even if all clients are disconnected.

### A Collaborative Note-taking Server

```ruby
require 'socket'

server = TCPServer.new(2345)

notes = []

# Loop to start multiple threads to serve multiple clients
loop do
  Thread.start(server.accept) do |socket|
    socket.puts 'What is your name?'
    name = socket.gets.chomp
    # Loop to keep prompting commands
    loop do
      socket.puts '(q)uit, (w)rite, or (r)ead notes?'
      choice = socket.gets.chomp

      case choice
      when 'q'
        socket.puts 'Quitting!'
        socket.close
      when 'w'
        socket.puts 'Write your note:'
        note_body = socket.gets.chomp
        notes << "#{name}: #{note_body}"
      when 'r'
        socket.puts 'Notes:'
        notes.each { |note| socket.puts note }
      else
        puts 'That is not a command.'
      end
    end
  end
end
```

This server allows multiple connections by looping through new threads to accept clients.

Each client is prompted for their name, and then shown a options to quit, write notes, or read notes.

Each client is able to add notes to notes array, which can then be read by any client, even if they didn't write the note themselves.

### Note List App Hosting Server

```ruby
require 'socket'

server = TCPServer.new(2345)

class NoteList
  def initialize(io = Kernel)
    @io = io
    @notes = []
    start
  end

  def start
    # Loop to keep prompting commands
    loop do
      @io.puts '(q)uit, (w)rite, or (r)ead notes?'
      choice = @io.gets.chomp

      case choice
      when 'q'
        quit
        break
      when 'w'
        write
      when 'r'
        read
      else
        unknown_command
      end
    end
  end

  def quit
    @io.puts 'Quitting!'
  end

  def write
    @io.puts 'Write your note:'
    note_body = @io.gets.chomp
    @notes << note_body
  end

  def read
    @io.puts 'Notes:'
    @notes.each_with_index { |note, i| @io.puts "#{i +1}. #{note}" }
  end

  def unknown_command
    @io.puts 'That is not a command.'
  end
end

# Loop to start multiple threads to serve multiple clients
loop do
  Thread.start(server.accept) do |socket|
    NoteList.new(socket)
    socket.close
  end
end
```

Here NoteList is a class that implements the functionality previously.

Each thread serves a client, and provides them with their own new NoteList instance, with the socket injected to use as io (input/output), which usually defaults to kernel, meaning the NoteList class could work locally just as well.

As each client has their own NoteList instance they do not interfere with other clients.
