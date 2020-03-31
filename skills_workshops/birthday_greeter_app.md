# Birthday Greeter App - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/course/blob/master/intro_to_the_web/post_challenges/birthday_app.md)

Learning Objectives

- [ ] Practice networking, building servers, and handling HTTP request/response cycle

Achievement Plan

- [ ] AP

Evidence

- Evidence 1

## Practical

Create an web app that allows users to enter their name, their birthday, and will tell them "Happy Birthday" or tell them how many days until their birthday.

An example:

![Birthday Greeter App example](../images/birthday_greeter_app_example.jpg)

### Getting a Homepage

Created a directory, initialised git and bundler, and required Sinatra in the gemfile, and bundled.

Added an app dir, and created birthday_app.rb in it:

- Required sinatra
- Wrote a sinatra get do for '/', the homepage, returning "Hello there!"

localhost:4567 shows "Hello there!" in plain text.

Required shotgun in the Gemfile and installed with bundle, so I don't have to reload the server manually every time I make a change.

shotgun defaults to port 9393, localhost:9393 now shows the homepage.

### Creating an ERB template

Realised I didn't need the app dir and moved birthday_app.rb to top level dir.

Added a views dir, and index.erb:

- contains the text "Hello there!"

Modified birthday_app.rb:

- '/' now returns erb :index

Homepage still shows "Hello there!" in plain text.

### Adding to the template

Now to flesh out the template with the form in index.irb:

- Put the "Hello there!" text in an h1 element
- Added a form element
  - Contains matched labels and inputs, inputs are all required
  - Text input for name
  - Number input min 1 and max 31 for day
  - Select for month
  - Submit input with value "Go!"

The form renders properly, but the style is the stock html styles, which look pretty horrible.

### Adding CSS

Created a new folder called css, and added style.css:

- Added style for

Added style.css to index.rb:

- Added a head element, with a link element to style.css
- Wrapped the rest of the contents in a body element
