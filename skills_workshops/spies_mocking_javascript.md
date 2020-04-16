# Spies and Mocking in JavaScript - Skills Workshop

[All Workshops](README.md) | [Source]()

Learning Objectives

- [ ] Learn about spies in Jasmine
- [ ] Learn about mock objects in Jasmine

Achievement Plan

- [ ] AP

Evidence

- Evidence 1

## Notes

In `spec/handSpec.js`:

```js
describe("Test", function() {
  it("when it squeezes a boing, it returns boing", function() {
    var hand = new Hand()
    var boing = { noise: "boing" }
    expect(hand.squeeze(boing)).toEqual("boing")
  })

  it("when it squeezes a whizz, it returns whizz", function() {
    var hand = new Hand()
    var whizz = { noise: "whizz" }
    expect(hand.squeeze(whizz)).toEqual("whizz")
  })

  it("when it throws an object, it pulls its pin", function() {
    var hand = new Hand()
    var grenade = { pullPin: function(){} }

    spyOn(grenade, 'pullPin')
    hand.throw(grenade)

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

// function Boing() {
//   this.noise = "boing"
// }

// function Whizz() {
//   this.noise = "whizz"
// }

// function Toy(noise) {
//   this.noise = noise
// }
```