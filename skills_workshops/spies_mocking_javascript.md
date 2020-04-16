# Spies and Mocking in JavaScript - Skills Workshop

[All Workshops](README.md) | [Source]()

Learning Objectives

- [x] Learn about spies in Jasmine
- [x] Learn about mock objects in Jasmine

Achievement Plan

- [x] Workshop a small class, and annotate its code

Evidence

- Evidence 1

## Notes

In `spec/handSpec.js`:

```js
describe("Test", function() {
  it("when it squeezes a boing, it returns boing", function() {
    var hand = new Hand()
    // The mock object, an object literal that has noise of "boing".
    var boing = { noise: "boing" }
    expect(hand.squeeze(boing)).toEqual("boing")
  })

  it("when it squeezes a whizz, it returns whizz", function() {
    var hand = new Hand()
    // The mock object, an object literal that has noise of "whizz".
    var whizz = { noise: "whizz" }
    expect(hand.squeeze(whizz)).toEqual("whizz")
  })

  it("when it throws an object, it pulls its pin", function() {
    var hand = new Hand()
    // A mock object, an object literal that has pullPin which returns an empty anonymous function.
    var grenade = { pullPin: function(){} }

    // Spy on the grenade variable, and track the pullPin method.
    spyOn(grenade, 'pullPin')
    hand.throw(grenade)

    // An expectation that grenade will have its pullPin method called.
    expect(grenade.pullPin).toHaveBeenCalled()
  })
});
```

in `src/hand.js`:

```js
function Hand() {
}

Hand.prototype.squeeze = function(squeezable) {
  return squeezable.noise
}

Hand.prototype.throw = function(throwable){
  throwable.pullPin()
}

// The probable implementation of an actual boing and whizz.

// function Boing() {
//   this.noise = "boing"
// }

// function Whizz() {
//   this.noise = "whizz"
// }

// The A Function Factory pattern for creating generic toys with a noise.

// function Toy(noise) {
//   this.noise = noise
// }
```