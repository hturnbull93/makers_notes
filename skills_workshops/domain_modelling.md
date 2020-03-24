# Domain Modelling - Skills Workshop

[All Workshops](README.md) | [Source](https://github.com/makersacademy/skills-workshops/tree/master/week-2/domain_model_diagramming)

**Learning Objectives**

- [x] Describe a domain model as the nouns and verbs in a program, and the relationships between them.
- [x] Explain how you use domain model diagramming in your development process.
- [x] Use domain model diagramming to help you write better code.

**Achievement Plan**

- [x] Practice making a class diagram from user stories
- [x] Implement some skeleton code based on the diagram

**Evidence**

I have created a small program emulating a notebook based on a class diagram I made from user stories.

## Notes

### Domains and Models

**Domain:**

- An area of which you have control over.

**Model:**

- A representation of a real thing.
- The domain in which our problem sits and the representation of the real life things in the domain.

> "The map is not the territory"

The London Tube map is an abstracted version of the actual geographical map. The designers made this decision to make it readable for users.

**The geographical tube map:**

![the geographical tube map](https://i.pinimg.com/originals/4a/bf/0c/4abf0cf65b9ecd6febeb90cca97a5488.gif)

**The model tube map:**

![the model tube map](https://tfl.gov.uk/tfl/syndication/widgets/tubemap/images/tube-medium-zoned.gif)

### Domain Model Diagramming

User stories help us make a diagram to make an informed guess a a model of all the objects and messages that should exist in a program before we start making it.

Planning is smaller chunks is good to start with. As I get better at domain modelling my models will become more accurate, I can take on larger plans.

Designing code and making design choices is inevitable. It is a good idea to have a think and plan first, so the design decisions become cheaper.

### Class Diagrams

The name of a class it's attributes, and its methods. Representing the relationship between objects in the model.

**Class Diagram example:**

![Class Diagram example][Class Diagram example]

**Practice using [Mermaid Live Editor]**

User stories for a Notebook

> As an office worker  
> So I can record useful information  
> I want to be able to create a text note

> As an office worker  
> So I can carry all my useful information  
> I want to keep all my notes in a notebook.

> As an office worker  
> So I can categorise a note  
> I want to be able to add a tag (only one tag) to a note

> As an office worker  
> So I can find notes on a certain topic  
> I want to be able to search for all the notes with a specific tag

![Notebook Example][Notebook example]

**A skeleton implementation following the diagram**

```ruby
class Notebook
  def initialize
    @notes = []
  end

  def keep(note)
    @notes << note
  end

  def search_by_tag(tag)
    # filters @notes array by passed tag, prints those notes
  end
end

class Note
  def initialize(information)
    @information = information
  end

  attr_reader :tag, :information

  def categorise(tag)
    @tag = tag
  end
end
```

### Don't get lost in the tools

The end goal is to make software that meets the requirements, getting lost in using tools, modelling, kanban, or anything like that doesn't help if it stops you making the software work for the users.

### UML Modelling

Unified Modelling Language is a standard maintained by the Object Management Group.

This standard will allow devs to diagram any domain model diagram they come across, without needing to work out the notation.

Diagram | Explanation
------- | -------
**Use-case diagram** | illustrates a unit of functionality provided by the system. Includes "actors", the people that do the action.
**Class diagram** | shows how the different entities (people, things, and data) relate to each other.
**Sequence diagram** | shows a detailed flow for a specific use case or even just part of a specific use case.
**State-chart diagram** | models the different states that a class can be in and how that class transitions from state to state.
**Activity diagram** | shows the procedural flow of control between two or more class objects while processing an activity.
**Component diagram** | provides a physical view of the system. Its purpose is to show the dependencies that the software has on the other software components (e.g., software libraries) in the system.
**Deployment diagram** | shows how a system will be physically deployed in the hardware environment.

[Intro to UML]

<!-- Links -->

[Class Diagram example]: https://mermaid.ink/img/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5cdEFuaW1hbCA8fC0tIER1Y2tcblx0QW5pbWFsIDx8LS0gRmlzaFxuXHRBbmltYWwgPHwtLSBaZWJyYVxuXHRBbmltYWwgOiAraW50IGFnZVxuXHRBbmltYWwgOiArU3RyaW5nIGdlbmRlclxuXHRBbmltYWw6ICtpc01hbW1hbCgpXG5cdEFuaW1hbDogK21hdGUoKVxuXG5cdGNsYXNzIER1Y2t7XG5cdFx0K1N0cmluZyBiZWFrQ29sb3Jcblx0XHQrc3dpbSgpXG5cdFx0K3F1YWNrKClcblx0fVxuXG5cdGNsYXNzIEZpc2h7XG5cdFx0LWludCBzaXplSW5GZWV0XG5cdFx0LWNhbkVhdCgpXG5cdH1cblx0Y2xhc3MgWmVicmF7XG5cdFx0K2Jvb2wgaXNfd2lsZFxuXHRcdCtydW4oKVxuICAgIFxuXHR9XG5cdFx0XHRcdFx0IiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifSwidXBkYXRlRWRpdG9yIjpmYWxzZX0

[Mermaid Live Editor]: https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5cbiAgTm91bnNcbiAgT2ZmaWNlIHdvcmtlclxuXG4gIFRleHQgbm90ZVxuICBJbmZvcm1hdGlvblxuICBOb3RlYm9va1xuICB0YWdcbiAgdG9waWNcblxuICBWZXJic1xuICBjcmVhdGVcbiAgY2F0ZWdvcmlzZVxuICBrZWVwXG4gIGFkZCB0YWdcbiAgc2VhcmNoIHRhZ3NcblxuICAgIE5vdGVib29rIC0tIE5vdGVcbiAgXHRjbGFzcyBOb3Rle1xuXHRcdC1TdHJpbmcgaW5mb3JtYXRpb25cbiAgICAtU3RyaW5nIHRhZ1xuICAgICtjYXRlZ29yaXNlKHRhZylcbiAgICArcmVhZCgpXG4gICAgK3JlYWRfdGFnKClcblx0fVxuXG4gICAgY2xhc3MgTm90ZWJvb2sge1xuICAgIC1BcnJheSBub3Rlc1xuICAgICtrZWVwKG5vdGUpXG4gICAgK3NlYXJjaF9ieV90YWcodGFnKVxuICB9XG4iLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ

[Notebook example]: https://mermaid.ink/img/eyJjb2RlIjoiY2xhc3NEaWFncmFtXG5cbiAgTm91bnNcbiAgT2ZmaWNlIHdvcmtlclxuXG4gIFRleHQgbm90ZVxuICBJbmZvcm1hdGlvblxuICBOb3RlYm9va1xuICB0YWdcbiAgdG9waWNcblxuICBWZXJic1xuICBjcmVhdGVcbiAgY2F0ZWdvcmlzZVxuICBrZWVwXG4gIGFkZCB0YWdcbiAgc2VhcmNoIHRhZ3NcblxuICAgIE5vdGVib29rIC0tIE5vdGVcbiAgXHRjbGFzcyBOb3Rle1xuXHRcdC1TdHJpbmcgaW5mb3JtYXRpb25cbiAgICAtU3RyaW5nIHRhZ1xuICAgICtjYXRlZ29yaXNlKHRhZylcbiAgICArcmVhZCgpXG4gICAgK3JlYWRfdGFnKClcblx0fVxuXG4gICAgY2xhc3MgTm90ZWJvb2sge1xuICAgIC1BcnJheSBub3Rlc1xuICAgICtrZWVwKG5vdGUpXG4gICAgK3NlYXJjaF9ieV90YWcodGFnKVxuICB9XG4iLCJtZXJtYWlkIjp7InRoZW1lIjoiZGVmYXVsdCJ9LCJ1cGRhdGVFZGl0b3IiOmZhbHNlfQ

[Intro to UML]: https://developer.ibm.com/articles/an-introduction-to-uml/