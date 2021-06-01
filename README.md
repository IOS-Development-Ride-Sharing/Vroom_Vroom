Original App Design Project - README Template
===

# VroomVroom

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Our app will be a social media app specifically designed for people such as college students to easily find rideshares. Users will be able to make posts about where they're driving to an from, and users will be able to see these posts in order to get a ride.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Lifestyle 
- **Mobile:** Our app will be mainly created for mobile app purposes.
- **Story:** This app will be compelling to our intended audience, which would be majority college students trying to go home from college. Our audience will find this app valuable as it is a need to get a ride home and see your family over the holidays/weekend.
- **Market:** Probably primarily college students who are driving between their college and other locations or anybody who wants to find a cheap ride or make some money
- **Habit:** The app will be a useful service, and it will hopefully be used whenever a user needs a ride or would like to make extra money on a long drive.
- **Scope:** The scope and the function of this app will pretty well defined. We have extra functions that we would like to implement, but they are not needed if we dont have enough time. This app will be somewhat challeneging but we beleive we can finish the app by the end of the program. A stripped-down version of this app would still be interesting to built as the app would still be useful to many students.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [X] Allow users to make posts about where they're driving
- [X] Allow users to see other peoples' posts so they can reach out about getting a ride

**Optional Nice-to-have Stories**

- [X] Allow users to search through posts by destination, departure location, and date
- [X] Allow users to log in and have an account on our app
- [ ] Allow users to message other users using an in-built messaging system
- [ ] Connect the app to Venmo so that riders can pay drivers securely through the app
- [ ] Allow users to leave reviews of drivers and riders

### 2. Screen Archetypes

* Screen showing posts that a user can scroll through
   * Display all current posts
   * [Optional] Add a search bar to allow users to search through posts
* Screen allowing users to create their own post
   * Have multiple fields: destination, departure, date and time, number of seats available, contact information, additional notes
* [Optional] Messaging screen allowing users to view and send messages to other users
* [Optional] Log in screen
* [Optional] Payment screen

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Find a Ride (page with posts, search bar on top)
* [Optional] Your Profile (possible add messages)

**Flow Navigation** (Screen to Screen)

* Find a Ride
   * Can tap on ride to see details screen that shows all information
   * [Optional] Can tap on driver name to message them
   * [Optional] Can see driver reviews
* [Optional] Your Profile
   * [Optional] Can see messages and send new messages
   * [Optional] Can see your reviews

## Wireframes
<img width="547" alt="Screen Shot 2021-04-24 at 11 30 46 AM" src="https://user-images.githubusercontent.com/59664875/115969186-942cc380-a4f0-11eb-87d2-43c018b5e155.png">


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
 | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | Driver        | Pointer to User| Driver Name |
   | Driver Picture| File     | profile picture |
   | caption       | String   | extra information from driver |
   | Departing | String   | Where is the driver leaving from? |
   | Destination| String   | Driver Destination |
   | Date / Time  | DateTime | date/time when driver is leaving |
### Networking
#### List of network requests by screen
   - Home Feed Screen
      - (Create/POST) Create a saved post
      - (Delete) Delete a saved post
      - (Read/get) Update feed.
   - Create Post Screen
      - (Create/POST) Create a new post
      - (Delete) Delete a post
   - Profile Screen
      - (Read/GET) Query logged in user object
      - (Update/PUT) Update user profile image
- [OPTIONAL: List endpoints if using existing API such as Yelp]

GIFS

First Sprint:

![part1](https://user-images.githubusercontent.com/59664875/119082258-8dd81d00-b9b2-11eb-8fef-e187245b4c7d.gif)

Part 2:

![part 2](https://user-images.githubusercontent.com/59664875/119082264-92043a80-b9b2-11eb-8386-6e710403141d.gif)

Second Sprint:

Part 3:

![ezgif com-gif-maker](https://user-images.githubusercontent.com/59664875/119912902-418c6000-bf11-11eb-9536-8db49ea400a8.gif)

Third Sprint:

Part 4:

![ezgif com-gif-maker](https://user-images.githubusercontent.com/59664875/120081962-16bb1c80-c075-11eb-9d57-b22a2223dc01.gif)






