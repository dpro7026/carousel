# README

This application uses a basic rails scaffold so a user can edit 'sliders' for the carousel found on the index page.

The carousel reads from the sliders model to generate images, title and content captions.

The application is running on IBM Bluemix cloud hosting (which a user can create a free 30 day trial account), and uses a Postgres ElephantSQL database.

Cloud storage uses ephemeral memory (based on the instance) rather than local memory, so paperclip's normal functionality of storing the image in the pubic folder and using a reference will fail when the application instance changes.

The concept is analogous to the tutorial for using Heroku hosting and Amazon S3 cloud storage for images:
* https://devcenter.heroku.com/articles/paperclip-s3

The only tutorial related to this I could find:
* https://www.altoros.com/blog/the-ibm-bluemix-object-storage-service-in-ruby-projects/

Bluemix runs on SoftLayer. This may help too:
* https://github.com/fog/fog-softlayer/blob/master/examples/storage.md

The method I used to deploy on Bluemix:
Create a ruby instance and an ElephantSQL instance. On the ruby instance, choose connect existing and connect the ElephantSQL DB.

Using the Cloud Foundry Interface (CFI):
Pushing to Bluemix:
Added to gemfile:
gem 'rails_12factor', group: :production
Then run:
Bundle install

Added to manifest.yml:
command: rake db:migrate && bin/rails server -p $PORT -e $RAILS_ENV

Then ran:
Cf api https://api.ng.bluemix.net
Cf login
Cf target –o organisation –s dev
Cf push
