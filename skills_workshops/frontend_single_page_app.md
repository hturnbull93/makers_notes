# Frontend Single Page App - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/course/blob/master/pills/frontend_single_page_app.md)

Learning Objectives

- [x] Understand how to prevent a page reloading
- [x] Alter content using event listeners

Achievement Plan

- [x] Understand and make notes on the examples

Evidence

- I have understood and made notes on the examples

## Notes

### Preventing Default Behaviour

In `index.html`

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Frontend, single page app</title>
  </head>

  <body>
    <a href="" id="tiger-link">Tiger</a>
    <div id="animal"></div>

    <script>
      makeTigerLinkClickSayTiger();

      // An event listener for "click" is added to the #tiger-link element.
      // When the event listener is triggered by a click the clickEvent's default behaviour is prevented.
      // Instead sayTiger is called.
      function makeTigerLinkClickSayTiger() {
        document
          .getElementById("tiger-link")
          .addEventListener("click", function(clickEvent) {
            clickEvent.preventDefault();
            sayTiger();
          });
      };

      // Grab the #animal element and change the innerHTML to "tiger".
      function sayTiger() {
        document
          .getElementById("animal")
          .innerHTML = "tiger";
      };
    </script>
  </body>
</html>
```

### Navigation with Hashes

In `index.html`

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Frontend, single page app</title>
  </head>

  <body>
    <!-- A variety of options to click -->
    <a href="#tiger">Tiger</a> | <a href="#lion">Lion</a> | <a href="#cheetah">Cheetah</a> | <a href="#leopard">Leopard</a>
    <div id="animal"></div>

    <script>
      makeUrlChangeShowAnimalForCurrentPage();

      // Adding an event listener for hashchange, calling showAnimalForCurrentPage as callback.
      // hashchange occurs when a hashlink is clicked.
      function makeUrlChangeShowAnimalForCurrentPage() {
        window.addEventListener("hashchange", showAnimalForCurrentPage);
      };

      // Here we pass window.location to getAnimalFromUrl.
      // And the result from that into showAnimal.
      function showAnimalForCurrentPage() {
        showAnimal(getAnimalFromUrl(window.location));
      };

      // window.location passed in here is the URL of the page.
      // It is an object and its hash value can be accessed and the # is trimmed off.
      function getAnimalFromUrl(location) {
        return location.hash.split("#")[1];
      };

      // Now we have the trimmed animal (from the clicked hash link), it is inserted into the #animal element.
      function showAnimal(animal) {
        document
          .getElementById("animal")
          .innerHTML = animal;
      };
    </script>
  </body>
</html>
```
