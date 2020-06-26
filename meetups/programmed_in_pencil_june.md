# Programmed in Pencil June Meet - Skills Workshop

[All Workshops](README.md)

Programmed in Pencil is a product engineering meetup.

June's meet sponsored by RVU, who are [hiring(!)](https://www.rvu.co.uk/careers/engineering)

Hosts: Jonathan Fielding, Natalie Yeo, Zara Najiballah (all RVU).

They appear to be hiring only seniors and leads, but I should ask about junior positions.

## Space Invaders

Srushtika Neelakantam ([@srushtika](https://twitter.com/Srushtika)) works for Ably Realtime, she's presenting how to make a multiplayer space invaders game ([deployed](https://space-invaders-multiplayer.herokuapp.com/)).

Core components of rt mp games:

Assets: Sprite sheets, images, sounds etc.

Physics: how entities interact (libraries are available).

Networking: so all players can play together, constant communication between all clients, so they all have the same context.

[Phaser](https://phaser.io/phaser3), for assets and physics (v3).

### Phaser

Renders to a canvas using gameConfig, important bit is GameScenes.

GameScenes are an array of scenes that the game plays through:

- preload method specifies assets that will be needed at some point by the scene.
- create method initialises vars, animations etc.
- update method runs in a loop as long as the scene is going on.

### Networking

When a player does an action, the event needs to be reflected on all clients.

The server holds a single point of truth, context, that is sent to each player. (Scales linearly).

Server publishes and sends a new game state every 100ms.

HTTP would be set up for each thing, too slow.

Websockets are better, they have initial HTTP handshake, then full duplex persistent connection, and allowing for push updates, not pull.

There are some alternatives to websocket, and also lots of open source implementations of websockets:

- Socket.io
- Socket Cluster
- faye-websocket
- SockJS
- Websocketd

To scale these though, you need something like Ably to manage websocket connections for you.

Full project available [here](https://go.ably.io/space-invaders-project).

Full writeup available [here](https://go.ably.io/space-invaders-article).

### How do you handle lag

Linear interpolation, run the game a few frames ahead before serving to players, so it doesn't matter if they are a little behind.

## Building high performance teams

Ryan Greenhall, [@ryangreenhall](https://twitter.com/ryangreenhall), engineering manager at RVU.

### Psychological Safety

If people don't feel safe at work, they won't speak up for fear of retribution.

People start to cover up issues etc.

If people don't feel safe, people wont bring "themselves" to work, and you risk having a monoculture of people keeping their heads down.

As a leader:

- Don't blame, and be quick to admit your part in mistakes.
- Failure is an opportunity to learn.
- Admit you don't know things, ask questions.
- Encourage dissent, challenge people to pick holes in your plans.

### Dependability

We succeed and fail as a team.

As a leader:

Lead by example.
Set clear and realistic expectations.

### Structure and Clarity

People must understand their responsibilities.

Establish the team charter.

Prod manager: owns the "what"
Eng manager: owns the "who"
Eng lead: owns the "how"

### Meaning

People want a sense of purpose.

Meaning of work could be about:

- Financial security.
- Feeling of contribution.

As a leader:

- What is your meaning?
- How does it help people?
- What impact does the team have?

### Impact

Are customers reporting improvements?

If you do not measure success, you cannot know if you are succeeding.

Objectives, and Key results.

- Objectives are a short description of something meaningful.
- Key results are things that you would see change as a result of the objective being met.

### How to tell if a company does these?

Ask how incidents are managed in the business, this could give you clues as to the culture and processes for good team dynamics.

Ask for diversity numbers, ratios of gender, ethnicities etc.

Ask more broadly how the teams are structured and are organised, how they track progress.

### Effect on Hiring

When interviewing:

- What business challenges they responded to.
- How they measure success.
- People who are willing to change.
- Describe the best team they worked in.

### How can you have an impact as a junior dev

Regardless of seniority, educate yourself about what makes a good team, to gain empathy about the techniques the leaders may be using.

Don't be afraid to speak up, coming to something as a fresh set of eyes can have benefits.

## Images, Pixels, Canvas, Tigers and Bears

Christian Heilmann [@codepo8](https://twitter.com/codepo8)

A web developer, focuses on making good tooling for chromium.

How we can get images onto the web, and once it's there, what can we do with it.

Getting images into the browser:

- Upload form
- Drag and drop
- Copy and paste

Generally this sort of stuff is very robust, and works well.

### Doing stuff with images

Canvas.

Built for speed, painting stuff.

A bit like an etchasketch in the browser.

Move to certain places, make arcs, move again.#

Everything results in an image, that is a png by default but can be webp or jpg.

You can read the width, height and rgba of all the pixels.

Example count colours used:

- Iterate through rgba, if key exists, increment, else add it and set to 1.

Read with getImagedata, write with putImageData.

getImageData can also get the particular coordinates and sample size.

You can wrap the canvas in a link, and use the download attr to give it a standard name to save as.

[makethumbnails.com](https://makethumbnails.com) - upload images and make thumbnails, download individually or as zip

[removephotodata.com](https://removephotodata.com) - upload and resave without EXIF data

[logo-o-matic](https://codepo8.github.io/logo-o-matic) - Cool

Canvas doesn't throw errors if you paint outside, but it does use memory (avoid it if possible).

Only need to convert? just keep it off the DOM.

### Advice for first job

Take a look into opn source projects, free way to learn things are built, how to work in teams, and to get something cool.

In these times look for a larger company that has infrastructure for learning.
