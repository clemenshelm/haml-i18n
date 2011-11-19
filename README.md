# haml-i18n

Haml-i18n provides basic functionality to translate [haml](https://github.com/nex3/haml) templates. Instead of writing `%p= I18n.translate('.user_name')` from now on you can just write `%p User name`.

Note that this is a very early version of the plugin. I just developed it to fit one project’s needs. If you find any errors please write an issue or provide a fix directly. Please take a look at _Contributing to haml-i18n_ on how to write a fix.

## Installation

Add `gem "haml-i18n"` to your project’s `GEMFILE` and run `bundle` to install haml-i18n and its dependencies.

## Usage

You can put your keys in plain text into your haml template:

    %p User name
  
This will try to

  * retrieve `[view_folder].[template_name].user_name`
  * retrieve `user_name` if the template-scoped translation doesn’t exist.
  
If none of these keys exist, the haml template just acts as usual: it renders 'User name'.
  
## Contributing to haml-i18n

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Clemens Helm. See LICENSE.txt for
further details.

## Thanks to…

[Cail](https://github.com/cail) for giving me the inspiration and a starting point with [haml\_i18n](https://github.com/cail/haml_i18n) for developing this gem.