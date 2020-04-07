# REST Game - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/sjmog/rest)

Learning Objectives

- [x] Understand RESTful resources and application states
- [x] Learn to design RESTful routes

Achievement Plan

- [x] Work through the discovery tool

Evidence

- I have made notes below
- I have practised understanding and designing RESTful requests with the [discovery tool](https://sjmog.github.io/rest/).

## Notes

### What is REST

REpresentational State Transfer

It is a software architectural style that defines a set of constraints to be used for creating Web services.

Web services that conform to the REST architectural style are called RESTful Web services.

### RESTful Resources

A resource is a piece of information that can be named and is kept in a location.

- A bookmark stored as a row in a database
- A user stored as a row in a database
- An image stored as a string in-memory on a server
- A bookmark stored as a string in-memory on a server
- A homepage stored as a file on the hard drive of a server

Each resouce has a Unique Resource Identified (URI):

| URI Route                                      | Explanation                                             |
| ---------------------------------------------- | ------------------------------------------------------- |
| <http://example.com/restaurants/nice-cafe>     | Nice Cafe is a document in the Restaurant collection    |
| <http://example.com/libraries/british-library> | British Library is a document in the Library collection |

### REST, CRUD and HTTP

Representations tie URL/URIs to actions a user may take

- `GET /bookmarks/1`
- `GET /users/217`
- `GET /image.jpg`
- `GET /bookmarks/1`
- `GET /index.html`

Databases CRUD actions can be mapped on to HTTP request types as RESTful routes.

| CRUD   | RESTful HTTP Request | Example                                                                 |
| ------ | -------------------- | ----------------------------------------------------------------------- |
| Create | POST                 | `POST /restaurants` creates a new document in the Restaurant collection |
| Read   | GET                  | `GET /restaurants/nice-cafe` returns the Nice Cafe document             |
| Update | PUT                  | `PUT /restaurants/nice-cafe` edits the Nice Cafe document               |
| Delete | DELETE               | `DELETE /restaurants/nice-cafe` deletes the Nice Cafe document          |

### States and State Transitions

States are what a web application has. State transitions are movements between states.

| Step                  | HTTP Request                   | State or Transition |
| --------------------- | ------------------------------ | ------------------- |
| Having 60 restaurants | `GET /restaurants`             | State               |
| Adding a restaurant   | `POST /restaurants`            | State Transition    |
| Having 61 restaurants | `GET /restaurants`             | State               |
| Deleting a restaurant | `DELETE /restaurants/old-cafe` | State Transition    |
| Having 60 restaurants | `GET /restaurants`             | State               |
