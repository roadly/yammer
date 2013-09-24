The Yammer Ruby Gem
====================
A Ruby wrapper for the Yammer REST APIs

This wrapper is heavily inspired by the [Twitter](https://github.com/jnunemaker/twitter) Ruby Gem (which is AWESOME and you should definitely check)

This gem wouldn't have been possible with the awesomeness of the Twitter Gem and the work **all** their contributors have put into it (and all the other great libraries we depend upon). Please consider [financially supporting the development](http://pledgie.com/campaigns/1193) of the Twitter Ruby Gem.

Installation
------------
    gem install yammer

What's in 0.1.4?
----------------

This release rips old the old api dependencies on Faraday and whatever else handles connection related issues and passed it all off to Yammer's own Yam gem(which itself uses Faraday).

Improved api support

    yam.users
    yam.in_group  

Better Exception Handling

    It was completely broken, now you can catch all sorts of exceptions with Yammer api based upon http status:
    
    - 400: Yammer::BadRequest
    - 401: Yammer::Unauthorized
    - 403: Yammer::Forbidden
    - 404: Yammer::NotFound
    - 406: Yammer::NotAcceptable
    - 500: Yammer:InternalServerError
    - 502: Yammer::BadGateway
    - 503: Yammer::ServiceUnavailable


Getting Started
---------------

You should probably be using Omniauth(http://github.com/intridea/omniauth), cuz its awesome, and be following that flow.  Ryan Bate's excellent RailsCasts are also a great reference: http://railscasts.com/episodes/236-omniauth-part-2

Whatever controller handles the callback, you will have access to a "credentials" key in the oauth object which has an "expires" key, and a "token" key.  I stash that entire object in a serialized string in my Authentication model.  This token is what you will need.

    token = current_user.authentications.find_by_provider("yammer").credentials.token
    yam = Yammer.new(oauth_token: token)
    
That's it!

    yam.groups
    yam.users


TODO
----

* Specs, specs and specs ... we lack tests even basic ones.
* Support for the following APIs
  * Likes
  * Topics
  * Users
  * Group Memberships
  * Networks
  
Contributing
------------
In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing tests
* by writing code (**no patch is too small**: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by closing [issues](https://github.com/roadly/yammer/issues)
* by reviewing patches

All contributors will be added to the [HISTORY](https://github.com/roadly/yammer/blob/master/HISTORY.md)
file and will receive the respect and gratitude of the community.

Submitting an Issue
-------------------
We use the [GitHub issue tracker](https://github.com/roadly/yammer/issues) to track bugs and
features. Before submitting a bug report or feature request, check to make sure it hasn't already
been submitted. You can indicate support for an existing issue by voting it up. When submitting a
bug report, please include a [Gist](https://gist.github.com/) that includes a stack trace and any
details that may be necessary to reproduce the bug, including your gem version, Ruby version, and
operating system. 

Submitting a Pull Request
-------------------------
1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add documentation for your feature or bug fix.
5. Run <tt>bundle exec rake doc:yard</tt>. If your changes are not 100% documented, go back to step 4.
6. Commit and push your changes.
7. Submit a pull request. Please do not include changes to the gemspec, version, or history file. (If you want to create your own version for some reason, please do so in a separate commit.)



Copyright
---------
Copyright (c) 2011, Bruno Mattarollo <bruno@road.ly>
See [LICENSE](https://github.com/roadly/yammer/blob/master/LICENSE.md) for details.
