# Quora Clone - A Question/Answer Platform

Welcome to the Quora Clone project! This is a web application that replicates the features of the popular question/answer platform Quora. Users can ask questions, answer questions, follow topics, and interact with the community. This README will guide you through setting up the project and understanding its features.

## Table of Contents

- [Dependencies](#dependencies)
- [Getting Started](#getting-started)
- [Features](#features)
- [Demo Video](#demo-video)

## Dependencies

To run this project, make sure you have the following dependencies installed:

- Ruby v2.7.8
- Rails v5.2.8.1
- [Check other dependencies](https://github.com/HuniaNad/quora-clone/blob/master/Gemfile.lock)
You can install Ruby using tools like RVM or rbenv. For Rails, you can use the gem installer:

```bash
gem install rails -v 5.2.8.1
```
## Getting Started

Follow these steps to set up the project on your local machine:

1. **Clone this repository:**

    ```bash
    git clone https://github.com/HuniaNad/quora-clone.git
    cd quora-clone
    ```

2. **Install gem dependencies:**

    ```bash
    bundle install
    ```

3. **Set up the database:**

    ```bash
    rails db:create
    rails db:migrate
    ```

4. **Check and configure the `.env.example` file:**

    Before running the application, make sure to review the `.env.example` file in the project directory. You may need to copy it to a new file named `.env` and configure the environment variables according to your needs. This file typically contains settings like database credentials, mailer credentials, and secret keys.

5. **Seed the database with initial data:**

    ```bash
    rails db:seed
    ```

6. **Start the server:**

    ```bash
    rails server
    ```

7. **Access the application in your browser at http://localhost:3000.**

## Features

This Quora Clone includes the following features:

- **Authentication:** Users can sign up or log in. User profiles include information such as name, age, gender, email, username, and profile picture. Users can edit their profile information.

- **Home Page:** Users can view questions related to topics they are following. They can search for topics and questions, answer questions, and like/dislike questions and answers. Answers are sorted by likes/dislikes, and only the top two answers are displayed initially.

- **Add Topics:** Users can add topics, each with a title, description, and picture. They can add questions to these topics, and a question can belong to one or more topics.

- **Topic Page:** This page displays the total number of users following the topic and lists questions related to the topic. Pagination is implemented for more than 10 questions.

- **About Page:** Users can view their information, including the following topics, asked questions, and answers.

- **Profile Page:** Users can view information about other users by clicking on their usernames. They can also see questions answered by a specific user.

## Demo Video
[Youtube Video Link](https://youtu.be/TSoHLiETk4Y)
