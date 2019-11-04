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

I mispoke during our meeting. Apparently Rails 5.2 introduced Active Storage! It's a quick and dirty way to store images directly in the database (or something equivalently simple). While *normally* we might avoid this, I think this is a great use-case for this method. So, yay!
