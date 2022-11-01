# Band tracker
Let's track our favorite bands and where they're playing next!

```
$ git clone https://github.com/kyleschmolze/active-record-band-tracker
$ cd active-record-band-tracker
$ rails generate model Band name:string genre:string slug:string
$ rails db:migrate
```

1. On the `Band` model, add a validation on the `:name` attribute for presence and uniqueness. Write tests to confirm that both are working!
2. On the `Band` model, write a method called `:generate_slug` which assigns `self.slug` using the band's name. Then, attach a `before_create` callback to call this method anytime a Band is created.
3. Look at the TODOs in `app/controllers/band_controller.rb` and `spec/requests/band_spec.rb`.

Bonus: Use HTTParty to make a GET request to the albums API at
```
https://theaudiodb.com/api/v1/json/2/discography.php?s=NAME_OF_BAND
response = HTTParty.get("a_full_url_here")
binding.pry # check out response to see what you got back!
```
Put this inside a `band.albums` method. Does it hit the API every time you call the method?
