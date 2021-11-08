![](https://img.shields.io/badge/Microverse-blueviolet)

### TWITTER

Clone website of Twitter. The project was made with ruby on rails, and include the following features:

- Log in and out.
- Follow users:
```
- Follow and remove follow from users.
- Search from friends by user id.
```
- Profile page for users.
```
- Profile contains: profile picture, banner, 
- Posts from that uses
- User information like numbers of post, follows and people that is following the user.
```
- Post 
```
- Create and destroy post
- User can post images
- Main page have the featura that shows 10 post per page, to see older post need to click on the next button.
- Post can be comented.
- Post page that allows you to all comments per post, but also with 10 comments per page.
```
- Comments 
```
- User can comment on post
- On the main page post will only show the last 3 comments
```
- Discover feature that allows you to see post from people you are not following.

Design made by [Gregoire Vella](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details). 

### Images

<img src="lib/assets/homes.png">

The project contains a user log-in page and 'follows user' system, allowing the user to follow other users and see their posts, also each profile shows each user's amount of posts, followers, and users that person is following.

<img src="lib/assets/profile.png">

The main page allows you to see all the posts from the users you are following and, also includes a panel where you can see people you may be interested to follow.

<img src="lib/assets/connect.png">

The menu is always present on all pages except for the login and signs in ones, the menu includes a home page, a connect page where you can find other users, a discover page where you can find posts from people you don't follow, a profile where you can see your profile and a statistics page that is not working at the moment.

The top menu bar contains the write new post, message icon, find icon, and options but only the options one is working at the moment, here you can log out of your account or edit your account.

<img src="lib/assets/discover.png">

The edit account options include the banner and profile picture.
The post sections are shown either on the home or on each profile, with the difference that each profile will only show the posts from that user, each post allows you to post text and images, at the moment you can only upload one image per post.
Each post has the option to have multiple comments from different users.

### Live Version

- [Link to live version](https://secure-springs-89314.herokuapp.com/)


### Prerequisites

- Windows, Mac, or Linux machine 

- Web browser other than Internet Explorer

- Postgres installed and set it up [see how](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart)

​
## Getting Started

To get a local copy up and running follow these simple example steps.

- First, you need to fork the repository [Twitter](https://github.com/JAAR91/twitter)

- Copy the ssh using the green code button

- Then you clone the repository to your pc using, the command on your terminal:

```
git clone 'ssh code  you copy early'
```

### Setup

Install gems with:

```
bundle install
```

Then use the following code on your terminal:

```
run yarn install
```

then

```
rails webpack:install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

If you get and error while creating the database then you have to install Postgres, follow the steps [here](https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart), once installed you only need to create a user and the database.

To create the database type on your terminal:
```
sudo -u postgres psql
```
Then type:
```
createdb twitterdb
```
Now you cant try to create the database again.

To make easier the creation of the database, use to create the database and create the tables at the same time:
```
bash createdb.sh
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.


### Test

To run test you need to create the test database with Postgres, first get into Postgres configuration using:
```
sudo -i -u Postgres
```
Then create the database using:
```
createdb twitterdbtest
```
To exit just type:
```
exit
```
To test the functions of the project just run:

```
    rspec
```

If you want to add more test just go to rspec/features folder, create a new file for each one of the tables.

### Build With

- Ruby 
- Rails
- SQL


👤 **Author**

👤 **Jose Alberto Arriaga Ramos**

- GitHub: [@jaarkira](https://github.com/jaarkira )

- Twitter: [@91_jaar](https://twitter.com/91_jaar )

- LinkedIn: [Jose Arriaga](https://www.linkedin.com/in/jaar/)
​

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support


Give a ⭐️ if you like this project!


## Acknowledgments

- Microverse ( https://www.microverse.org/ )

## 📝 License

​
 
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About