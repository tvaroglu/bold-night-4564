# B2 Assessments

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.7.2 and is based on Rails 5.2.4.3.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd b2-mid-mod`
5. `bundle install`

When you run `bundle exec rspec` you should have 0 tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## User Stories -- Railer Coaster

### Overview

We are creating an application to track the maintenance of amusement park rides and mechanics working on those rides.

* Mechanics have a name and years of experience attributes
    * ex. name: 'Kara Smith', years_experience: 11
* Rides have a name, thrill rating, and open (boolean) attributes
    * ex. name: 'The Hurler', thrill_rating: 7, open: false
* Mechanics can work on many Rides
* Rides can have many Mechanics working on them

Some of the initial migrations and model set up has been done for you. After you set up your database, you should be able to run the tests and see two passing tests.

```
Story 1 - Mechanic Index Page

As a user,
When I visit the mechanics index page
I see a header saying “All Mechanics”
And I see a list of all mechanic’s names and their years of experience
And I see the average years of experience across all mechanics
```

```
Story 2 - Mechanic Show Page

As a user,
When I visit a mechanic show page
I see their name, years of experience, and the names of all rides they’re working on
And I only see rides that are open
And the rides are listed by thrill rating in descending order (most thrills first)
```

```
Story 3 - Add a Ride to a Mechanic

As a user,
When I go to a mechanics show page
I see a form to add a ride to their workload
When I fill in that field with an id of an existing ride and hit submit
I’m taken back to that mechanic's show page
And I see the name of that newly added ride on this mechanics show page

Ex:
Mechanic: Kara Smith
Years of Experience: 11

Current rides they’re working on:
The Frog Hopper
Fahrenheit
The Kiss Raise

Add a ride to workload:
Ride Id: _pretend_this_is_a_textfield_
Submit
```


### Extension

```
Extension - Amusement Park Show page

As a visitor,
When I visit an amusement park’s show page
I see the name and price of admissions for that amusement park
And I see the names of all the rides that are at that theme park listed in alphabetical order
And I see the average thrill rating of this amusement park’s rides
Ex: Hershey Park
   Admissions: $50.00

   Rides:
          1. Lightning Racer
          2. Storm Runner
          3. The Great Bear
   Average Thrill Rating of Rides: 7.8/10

Note: You may have to make new migrations for this story
```
