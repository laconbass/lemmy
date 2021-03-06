# LEMMY-IAI

## Installation

lemmy-iai has a built in install script for quickeness.
You can download and execute it as follows:

    sh <(curl -s https://raw.github.com/laconbass/lemmy-iai/master/install)

or

    wget -O - https://raw.github.com/laconbass/lemmy-iai/master/install | sh

# LEMMY.
## 49% Motherfucker | 51% Son of a Bitch JS/CS Express+Mocha+HTML5 boilerplate that kicks your ass.

This bomber boilerplate is a humble tribute to __The Man__ himself, the Godfather of Heavy Metal, the Hellraiser: __[Lemmy Kilmister][0]__.

Perhaps you may have heard of him as the trust-worthy roadie of *[Jimi Hendrix][1]*,
the raw base of the 70's space rock powerhouse *[Hawkwind][2]* or, most
probably, as the relentless force behind the all-mighty *[Motörhead][3]*. If you have not had the distinct pleasure of listening to ripping, mean, and kick-ass rock'n'roll he makes you might want to check it out! Meanwhile, forget about the typical web framework development overkill and take Lemmy for a spin! It could be your rocking ace of spades!


### Purpose

The idea behind Lemmy is simple: __Express.js development on speed!__

Designed from scratch to kick-start your *[Express][4]* application in
either *Javascript* or *[Coffee-Script][5]* in no time and agilize the
management of the most common tasks during the development, testing, and
deployment of your project by just using Makefile and a couple of Bash commands
available on your Linux/OSX system without imposing any convention or creating
any web framework, Lemmy is the iron fist that can motorize your development.

Dedicated to all the beer drinkers and Hell raisers out there!


### Pre-Requisites

You have to use a UNIX-like or a BSD-like system that supports Makefiles and uses
[Bash shell][6]. You also need [Git source code management system][7] and [Node.js][8] installed
on your machine. That's all you need!

Optional: You might want to have a bottle of **Jack Daniel's** at hand!

### Quick Start

It is very easy to start using __Lemmy__. In fact, all you need to do is:

* Fork this project and rename it as you like.

```shell
  git clone https://github.com/rock-n-code/lemmy your_project_name
```

* Setup your project and choose your language of choice

```shell
  cd your_project_name && make setup [LANGUAGE=cs] [TYPE=standard|modular] [ENGINE=ejs|jade]
```

* Modify the *package.json* file to your requirements with your Text
  Editor of choice.

* Install all the dependencies locally.

```shell
  make dependencies
```

### Available Commands

The commands __Lemmy__ provides you are:

* *setup* : Kick-starts your JS/CS Express project for once and for all.
* *clean* : Cleans up all the generated code from your Express project.
* *update* : Updates all the Lemmy files on your project.
* *dependencies* : Installs locally all the dependencies defined on the package JSON file.
* *app* : Generates a new Application file and its respective Test file into your project.
* *layout* : Generates the layout and respective assets into your project or apps within the project.
* *module* : Generates a new Module file and its respective Test file into your project.
* *helper* : Generates a new Helper file and its respective Test file into your project.
* *middleware* : Generates a new Middleware file and its respective Test file into your project.
* *route* : Generates a new Route Container file and its respective Test file into your project.
* *controller* : Generates a new Controller file and its respective Test file (and views) into your project.
* *model* : Generates a new Model file and its respective Test file into your project.
* *view* : Generates a new View file into your project.
* *partial* : Generates a new Partial file into your project.
* *build* : Compiles your CS code into the JS equivalent.
* *watch* : Watches any change on your CS code and automatically compiles it into its JS equivalent.
* *run* : Runs your project on Development environment.
* *run-as-production* : Runs your project on Production environment.
* *test* : Tests your Express project using Mocha.
* *prepare* : Prepares your Express project for deployment.
* *mit-license* : Generates a MIT license for your Express project.
* *help* : Displays the Help menu you're reading right now.
* *version* : Displays the version of Lemmy that you've installed on your machine.

### ToDos

This is the list of all the required and/or wish
features that will be implemented on __Lemmy__ in the near future, in random order:

* Integrate [Mobile HTML5 boilerplate][29] as a layout.
* Integrate [Twitter's Bootstrap][22] as a layout.
* Integrate [jQuery Mobile][23] as a layout.
* Universal support.

### Contributors

The following people are helping to make __Lemmy__ an essential tool
for every [Express][4] developer:

* [Javier Cicchelli][11]
* [Mariela Dimitrova][31]

No matter how small or big your contribution to this project is, you'll be
added to this list by default.

### Thanks

__Lemmy__ relies on the invaluable contribution done by the Open Source
community and, in particular, the immense contribution of certain individuals who have kick-started
some of the greatest and most useful tools ever created for developers:

* Javascript by [Brendan Eich][15]
* [Makefile][16] by Stuart Feldman
* [Git][7] by Linus Torvalds
* [Node.js][8] by [Ryan Dahl][17]
* [Express][4], [Mocha][13], [EJS][14] and [Jade][30] by [TJ Holowaychuk][18]
* [Coffee-Script][5] by [Josh Askhenas][19]
* [Jitter][12] by [Trevor Burham][20]
* [Request][32] by [Mikeal Rogers][33]
* [HTML5 boilerplate][10] by [Paul Irish][21]
* [1140 CSS Grid][34] by [Andy Taylor][35]

Moreover, I also would like to thank the following blogs and sites for featuring __Lemmy__:

* [DailyJS][26] by [Alex Young][27] and [Yuka Young][28]

### More Information

Follow [Rock & Code][24] and/or [Javier Cicchelli][25] on Twitter for updates or a direct contact.

![Lemmy Kilmister][9]

### MIT License

Copyright (c) 2011-2012 Javier Cicchelli &lt;javier@rock-n-code.com&gt;

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the 'Software'), to deal in the Software
without restriction, including without limitation the rights to use, copy, modify,
merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

[0]: http://en.wikipedia.org/wiki/Lemmy
[1]: http://www.jimihendrix.com
[2]: http://www.hawkwind.com/
[3]: http://www.imotorhead.com
[4]: http://expressjs.com
[5]: http://coffeescript.org
[6]: http://www.gnu.org/software/bash
[7]: http://git-scm.com
[8]: http://nodejs.org
[9]: http://30daysout.files.wordpress.com/2010/12/lemmypublicity1robertjohn_20101130_123211.jpg
[10]: http://html5boilerplate.com
[11]: https://github.com/mr-rock
[12]: https://github.com/TrevorBurnham/Jitter
[13]: http://visionmedia.github.com/mocha
[14]: https://github.com/visionmedia/ejs
[15]: http://brendaneich.com
[16]: http://www.gnu.org/software/make/manual/make.html
[17]: http://tinyclouds.org
[18]: http://tjholowaychuk.com
[19]: https://github.com/jashkenas
[20]: http://trevorburnham.com
[21]: http://paulirish.com
[22]: http://twitter.github.com/bootstrap
[23]: http://jquerymobile.com
[24]: http://twitter.com/#!/rockncode
[25]: http://twitter.com/#!/monsieur_rock
[26]: http://dailyjs.com/2012/02/15/node-roundup
[27]: http://twitter.com/#!/alex_young
[28]: http://twitter.com/#!/YukaYoung
[29]: http://html5boilerplate.com/mobile
[30]: http://jade-lang.com
[31]: https://github.com/dream-warrior
[32]: https://github.com/mikeal/request
[33]: http://www.mikealrogers.com
[34]: http://cssgrid.net
[35]: http://twitter.com/#!/andytlr
