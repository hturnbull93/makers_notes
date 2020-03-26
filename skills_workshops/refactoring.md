# Refactoring - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/refactoring.md)

Learning Objectives

- [x] Improve the design of existing code.

Achievement Plan

- [x] Extract variable for unnamed expressions
- [x] Extract method for unnamed procedures
- [x] Extract class for unnamed objects

Evidence

- I have completed [4 practical exercises](#practicals), extracting variables, methods, and classes for each.

## Notes

### What is Refactoring

> Refactoring is a controlled technique for improving the design of an existing code base. Its essence is applying a series of small behaviour-preserving transformations, each of which "too small to be worth doing". However the cumulative effect of each of these transformations is quite significant. – Martin Fowler

Refactoring comes after Red, Green in the TDD cycle. It improves the human readability and may also reduce the complexity of code to help with compute time.

### Extracting variables

```ruby
# Understands adding two numbers and printing the result with a header
class Calculator
  def add(number_1, number_2)
    puts("The result is: #{number_1 + number_2}")
  end
end
```

In the comment the words result and header are mentioned, but don't appear in the code.

Refactoring to include named variables improves human readability.

```ruby
# Understands adding two numbers and printing the result with a header
class Calculator
  def add(number_1, number_2)
    result = number_1 + number_2
    header = "The result is: "

    puts("#{ header }#{ result }")
  end
end
```

This is also the reason that we extract "magic numbers" out of code and assign them to constants with an appropriate name

```ruby
class Airport
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  # ... rest of the Airport class ...

end

```

### Extracting methods

At the moment the print add method has two responsibilities: it adds the numbers and also prints them.

This goes against the OO principle of Single Responsibility. Refactoring to move the header variable and the puts to a separate print method improves SRP. Also, the print method is private, meaning it cannot be called directly (calc.print), it can only be called my other methods of the Calculator class.

```ruby
# Understands adding two numbers and printing the result with a header
class Calculator
  def add(number_1, number_2)
    result = number_1 + number_2
    print(result)
  end

  private

  def print(result)
    header = "The result is: "
    puts("#{ header }#{ result }")
  end
end
```

### Extracting classes

Now that there are two separate methods, that's an improvement but the Calculator class still isn't cohesive in its encapsulation.

This means that the methods it contains aren't necessarily related to one another. Extracting print to a separate class (Printer) fixes this.

```ruby
# Understands adding two numbers
class Calculator
  def add(number_1, number_2)
    result = number_1 + number_2
    Printer.new.print(result)
  end
end

# Understands printing the result
class Printer
  def print(result)
    header = "The result is: "
    puts("#{ header }#{ result }")
  end
end
```

Now the Calculator and Printer are separate classes that work together.

## Practicals

### Practical 1

```ruby
def send_email_to(user)
  Mail.new(user.email.strip).send_message
end
```

Extracting variables:

```ruby
def send_email_to(user)
  stripped_text = user.email.strip
  email = Mail.new(stripped_text)

  email.send_message
end
```

Extracting methods:

```ruby
def send_email_to(user)
  prepared_email = prepare_email(user)
  email = Mail.new(prepared_email)
  email.send_message
end

private

def prepare_email(user)
  user.email.strip
end
```

Extracting classes:

```ruby
class UserContacter
  def initialize
    @email_preparer = EmailPreparer.new
  end

  def send_email_to(user)
    prepared_email = @email_preparer.prepare_email(user)
    email = Mail.new(prepared_email)
    email.send_message
  end
end

class EmailPreparer
  def prepare_email(user)
    user.email.strip
  end
end
```

### Practical 2

```ruby
def tell_browser_type(browser)
  if(browser.type == "Safari")
    puts "You are using the Safari browser."
  else
    puts "You are using a non-Safari browser."
  end
end
```

Extracting variables:

```ruby
def tell_browser_type(browser)
  safari_message = "You are using the Safari browser."
  non_safari_message = "You are using a non-Safari browser."
  browser_is_safari = browser.type == "Safari"

  browser_is_safari ? puts safari_message : puts non_safari_message
end
```

Extracting methods:

```ruby
def send_browser_message(browser)
  safari_message = "You are using the Safari browser."
  non_safari_message = "You are using a non-Safari browser."

  browser_is_safari?(browser) ? puts safari_message : puts non_safari_message
end

private

def browser_is_safari?(browser)
  browser.type == "Safari"
end
```

Extracting classes:

```ruby
class BrowserMessage
  def initialize
    @browser_check = BrowserCheck.new
  end

  def send_browser_message(browser)
    safari_message = "You are using the Safari browser."
    non_safari_message = "You are using a non-Safari browser."

    @browser_checker.safari?(browser) ? puts safari_message : puts non_safari_message
  end
end

class BrowserChecker
  def safari?(browser)
    browser.type == "Safari"
  end
end

```

### Practical 3

```ruby
def send_correct_page(browser, window)
  if(browser.type == "Safari" && window.size < "768px")
    return "You are using the Safari browser in a small window."
  else
    return "You are not using the Safari browser or have a big window."
  end
end
```

Extracting variables:

```ruby
def send_correct_page(browser, window)
  browser_is_safari = browser.type == "Safari"
  window_is_small = window.size < "768px"
  safari_small_window_message = "You are using the Safari browser in a small window."
  non_safari_or_big_window_message = "You are not using the Safari browser or have a big window."

  browser_is_safari && window_is_small ? safari_small_window_message : non_safari_or_big_window_message
end
```

Extracting methods:

```ruby
def send_correct_page(browser, window)
  safari_small_window_message = "You are using the Safari browser in a small window."
  non_safari_or_big_window_message = "You are not using the Safari browser or have a big window."

  browser_is_safari?(browser) && window_is_small?(window) ? safari_small_window_message : non_safari_or_big_window_message
end

private

def browser_is_safari?(browser)
  browser.type == "Safari"
end

def window_is_small?(window)
  window.size < "768px"
end
```

Extracting classes:

```ruby
class BrowserPageChooser
  def initialize
    @browser_checker = BrowserChecker.new
    @window_checker = WindowChecker.new
  end

  def send_correct_page(browser, window)
    safari_small_window_message = "You are using the Safari browser in a small window."
    non_safari_or_big_window_message = "You are not using the Safari browser or have a big window."

    @browser_checker.safari?(browser) && @window_checker.small?(window) ? safari_small_window_message : non_safari_or_big_window_message
  end
end

class BrowserChecker
  def safari?(browser)
    browser.type == "Safari"
  end
end

class WindowChecker
  def small?(window)
    window.size < "768px"
  end
end
```

### Practical 4

```ruby
class Mail
  def initialize(email, fancy = false)
    @email = email
    @fancy = fancy
  end

  def send_message
    if fancy
      MailServer.connect("http://mixmax.com", api_key: "f20506xx808c").send_message({ to: @email, body: "Welcome to MyProduct, fancy person!" })
    else
      MailServer.connect("http://mixmax.com", api_key: "f20506xx808c").send_message({ to: @email, body: "Welcome to MyProduct" })
    end
  end
end
```

Extracting variables:

```ruby
class Mail
  def initialize(email, fancy = false)
    @email = email
    @fancy = fancy
  end

  def send_message
    server_address = "http://mixmax.com"
    api_key = "f20506xx808c"
    body = @fancy ? "Welcome to MyProduct, fancy person!" : "Welcome to MyProduct"
    email_details = { to: @email, body: body }

    mail_server = MailServer.connect(server_address, api_key: api_key)

    mail_server.send_message(email_details)
  end
end
```

Extracting methods:

```ruby
class Mail
  def initialize(email, fancy = false)
    @email = email
    @fancy = fancy
  end

  def send_message
    message = prepare_email
    mail_server = connect_mail_server
    mail_server.send_message(message)
  end

  private

  def connect_mail_server
    server_address = "http://mixmax.com"
    api_key = "f20506xx808c"
    MailServer.connect(server_address, api_key: api_key)
  end

  def prepare_email
    body = @fancy ? "Welcome to MyProduct, fancy person!" : "Welcome to MyProduct"
    { to: @email, body: body }
  end
end
```

Extracting classes:

```ruby
class Mail
  def initialize(email, fancy = false)
    @email = email
    @fancy = fancy
    @email_preparer = EmailPreparer.new
    @connected_mail_server = ConnectedMailServer.new
  end

  def send_message
    message = @email_preparer.prepare(@fancy)
    mail_server = @connected_mail_server.connect
    mail_server.send_message(message)
  end
end

class ConnectedMailServer
  def initialise
    @mail_server = MailServer.new
  end

  def connect
    server_address = "http://mixmax.com"
    api_key = "f20506xx808c"

    MailServer.connect(server_address, api_key: api_key)
  end
end

class EmailPreparer
  def prepare(fancy)
    body = fancy ? "Welcome to MyProduct, fancy person!" : "Welcome to MyProduct"
    { to: @email, body: body }
  end
end
```
