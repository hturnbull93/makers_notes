# Birthday Greeter App - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/course/blob/master/intro_to_the_web/post_challenges/birthday_app.md)

Learning Objectives

- [x] Practice building servers with MVC, handling HTTP request/response cycle, and HTML/CSS

Achievement Plan

- [x] Create a birthday greeter app

Evidence

- I have created a [birthday greeter webapp](https://github.com/hturnbull93/birthday-greeter-app)

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

Linked to style.css from index.rb:

- Added a head element, with a link element to style.css
- Wrapped the rest of the contents in a body element

Created a new folder called css, and added style.css:

- Added style for everything until it looked nice
- Added some classes to elements in index.rb to facilitate that

### Posting from the Form

The form generates needs to generate a response based on the users submitted information.

It should send a HTTP POST request.

- Updated the form element with action and method attributes in index.erb
- Added a post for '/' in birthday_app.rb

### Displaying Results

Now the params of the post request need to be integrated into the returned HTML, so added a new view, result.erb:

- Added a single h1 element, with erb tags to insert the variable the controller will create

Implemented the logic in birthday_app.rb:

- @birthday assigned with a date parsed from the month and day params from the form
- if that is equal to the date today, then @result is "Happy Birthday!"
- else the days between today and the birthday are calculated and @result is "Your birthday is in x days."

### Final Touches

- Added a link to head back to the form and styled it nicely
- Got text to scale nicely using calc based on viewport width
- Refactored the emojis to allow them to wiggle with some animation keyframes
