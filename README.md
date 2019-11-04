# project-549
Activity finder.
also by Travis

## Adding things to your repo
1. `git add .`
2. `git commit -m "The commit message"`
3. `git push origin master`

## Pulling things from Sean's repo
1. `git fetch upstream`
2. `git checkout master` (if you're already on this branch it might put an error that you can ignore)
3. `git merge upstream/master` (you may have merge conflicts you need to solve here!!!)
4. `git push origin master` (this pushes your changes to YOUR remote repo)

## Merging things into Sean's repo
1. Go to github.com
2. Create a Pull Request
3. Let me know over text as a reminder to merge it in
4. I'll let you know when it's merged in or if any changes need to be made

## Creating your own feature branch
1. `git checkout -b name_of_your_banch`


# TODO

### Homepage
- Display weather (Weather API) **TRAVIS**
- Surf report (Spitcast) 
- User location **TRAVIS**
- Find activities button **JIE**
- Activities (3 to 5 of them) **JIE**
  - Photos
  - Description
  - Hours / Time
  - Location
  - Type (outdoor/indoor/group/event)
  - Comments
- In App advertisement "Add your own activity"

### Activities

### Profile page
- User info
- Filter parameters/options?

### Create activity page
- Activity form fields

---

# FAQs

### How does User authentication work?

https://medium.com/@wintermeyer/authentication-from-scratch-with-rails-5-2-92d8676f6836

### How do all images work on our site?

https://evilmartians.com/chronicles/rails-5-2-active-storage-and-beyond

I mispoke during our meeting. Apparently Rails 5.2 introduced Active Storage! It's a quick and dirty way to store images directly in the database (or something equivalently simple). While *normally* we might avoid this, I think this is a great use-case for this method. So, yay! Images everywhere!

### What models are in are database?

1. User: name, password, and image (maybe profile pic?)
2. Activity: title, description, start_time, end_time, event_type, user, image
3. EventType: name (Activity references this)

Where can I find them? `app/models/` is where they live and where their "relationships" are defined in Rails.

eg. 

```
  has_one :event_type
  has_one_attached :image
  belongs_to :user
```

### How is our project handling Bootstrap styling?

We just pull it in in the root HTML file: `app/views/layouts/application.html.erb`. It's just this simple line: `<%= stylesheet_link_tag 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css', media: 'all', 'data-turbolinks-track': 'reload' %>`

### I don't understand how Activities works. Who owns what?

`Activity` model has this data: title, description, start_time, end_time. That's the only data *it* manages. 

`Activity` *belongs_to* a `User`. `@user.activities` should display all of the `@user's` activities that they own and `@activity.user` should give you the `User` model that owns that `@activity`. In Rails, relationships are sometimes a two-way street. You can often get object A from B and B from A. 

So what about `EventType`? Sean just created a separate field called `event_type_id` and setup a relationship between an `Activity` and an `event_type`. Each `@activity` *has_one* `event_type`. So this is a case where we can't get `@event_type.activities`. Not easily, anyways, but it's still possible with some leg work `Activity.where(:event_type_id => the_id_you_want_to_look_at)`. But we can still get the `EventType` from the `Activity` like `@activity.event_type`.

### I don't understand how the Rails MVC architecture works. Remind me.

Rails is MVC, model view controller, basically follows this pattern:

1. User (client) makes a request `GET /activities`
2. The browser sends the request to the server domain (in dev: localhost:3000)
3. The server gets the requests and needs to handle it. First it checks the routes for `/activities`.
4. Then, if a route exists (not 404), map the route to the controller `ActivitiesController`.
5. The request `GET /activities` has to be mapped to an `action` as well. So, the server now looks for the appropriate action (in this case `activities#index`)
6. The server deals with the `index` action: handles any `before_action` methods in the controller, does any fancy things *inside* the controller action itself, then it - by default - will try to render `app/views/activities/index.html.erb`
7. The server creates the HTML to send to the user based on the `index.html.erb` file
8. The User (client) gets the HTML, the browser parses it, and - viola - we have an application.
