**CMSI 2022** Mobile Application Development, Spring 2023

# Assignment 0208
We start our practicum with a standalone mobile app—one that does not need to communicate with other servers or services in order to do what it seeks to do. For this assignment, we’d like you to demonstrate:
* The ability to compose and lay out views
* Knowledge of the Swift programming language
* Proper separation of views, models, and resources
* Basic event handling and business logic
* Successful use of version control for your code

## Background Reading
The [official SwiftUI tutorials](https://developer.apple.com/tutorials/swiftui) will likely comprise your primary resource for getting started with this assignment. Do and re-do them in order to get used to the core ideas and techniques behind this framework. Swift language specifics can be found on the [Swift resources page](https://developer.apple.com/swift/resources/). Once you are familiar with SwiftUI basics and are ready to go deeper or more specific, the broader [SwiftUI documentation site](https://developer.apple.com/documentation/swiftui/) should have what you need, in addition to the various help content that can be found in Xcode.

Finally, you can get help with design decisions by perusing the [iOS Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/) for best practices on how to use and arrange SwiftUI’s many views and controls.

For version control assistance or review, [this GitHub Classroom link](https://classroom.github.com/a/oWkXr7-A) will give you your own copy of a repository with notes and documentation about _git_ and GitHub, authored by GitHub. You can also use that repository to practice _git_ commands. The official [Git Book](https://git-scm.com/book/en/v2) is also completely available online. Chapters 1 and 2 are fundamental, with Chapter 3 becoming useful if you want to experiment safely without disrupting established code.

## For Submission
Create a mobile app for displaying a (preloaded) “list of stuff”—movies, outfits, parks, musicians, anime, games, countries, teams—take your pick! Allow the user to browse through what’s available, apply a filter or search, look at items in detail, and make a change or edit to the data (e.g., set a rating, like/dislike, comment/note, etc.). Pick something for which information is easily available so that you don’t spend too much time collating or gathering the data. The list also doesn’t have to be that big—we want to focus on programming, not data entry.

To ensure that this app is built according to best/recommended practices as well as show the knowledge you have gained about building an app, make sure to show the following:
* Use of model objects to separate data from presentation
* Storage of list in a JSON file to be loaded into model objects
* Use of environment objects to connect the model to the app’s views
* Effective layout via proper composition of stacks, spacers, padding, and other SwiftUI features
* Appealing color choices and visuals—demonstrate your mastery of views and their properties (without violating any iOS Human Interface Guidelines 😅)
* Use of images—duly credited of course
* Proper choice of input views and controls—sufficiently distinct from what’s in the tutorial
* At least one animation or transition
* Custom app icon

The SwiftUI tutorial reflects these practices in many respects already. Thus, for your own list of stuff, make sure to put your distinct stamp on them. Don’t just regurgitate code from the tutorial:
* A sufficiently distinct set of “stuff” should take care of the baseline functionalities and the first three recommended practices
* The remaining ones should be tailored to that “stuff”—be sure to rework the tutorial code to reflect your chosen items well
* Deductions will be applied if we don’t perceive sufficient customization of the tutorial code

Supply a simple _about.md_ Markdown file that describes your “list of stuff” app briefly. Highlight anything about the app that you think is particularly interesting or that you’re particularly proud of.

## Operational Tips/Suggestions
* So as not to let data entry compromise your programming time, plan on two phases of JSON file prep: first, load up “just enough” data from whatever source you pick to have enough information to play with while programming. Then, when the app is largely done, use the remaining time to populate your data file further, perhaps cherry-picking items that will highlight the range of your app most effectively
* Remember that there isn’t enough class time to cover absolutely everything that you might want to do! We hope that our class time so far has served to give you a good foundation for getting started, but definitely don’t let “this wasn’t mentioned in class” be a barrier when it comes to figuring things out

### Initial setup: Unifying your GitHub and Xcode repositories
The repository for this assignment comes _only_ with this _README.md_ by design, so that you can go through the motions of creating the app project in Xcode yourself. Checking _Create Git repository on my Mac_ will set things up properly but as a _separate_ repository from the one that you get with the assignment, and it takes some specialized _git_ commands to “cross the streams” successfully 👻

So, instead of the usual `git clone` command, do the following:
1. Create your initial Xcode project on your machine with the _Create Git repository on my Mac_ option checked
2. Acquire the URL of your assignment repository from the green `Code` button on GitHub—let’s call this `YOUR_REMOTE_URL` (this is also what you would do before doing an initial `git clone`, but in this case we will do something different with it—read on)
3. Make sure that you don’t have any pending changes on your Xcode project—if so, commit them
4. From the command line, `cd` into your Xcode project’s folder and type the following three commands:

```
git remote add origin YOUR_REMOTE_URL
git pull origin main --allow-unrelated-histories
git branch --set-upstream-to=origin/main main
```

(don’t forget to substitute `YOUR_REMOTE_URL` above for the specific URL of your GitHub repository)

That should do it! The repository created by Xcode and the assignment repository that GitHub Classroom gave you should now be “as one.” You should now be able to use _git_ on this folder as if you had `git clone`-d it normally.

## How to Turn it In
Commit the following to your repository:
- Complete Xcode project with all code, raw data, and assets
- _about.md_ file describing your app

## Specific Point Allocations
For this particular assignment, graded categories are as follows:

| Category | Points |
| -------- | -----: |
| Baseline functionality | 45 points total |
| • Top-level list of information | 10 points|
| • Detail view of individual item | 15 points |
| • At least one filter/search | 10 points |
| • At least one user-modifiable property | 10 points |
| Implementation specifications | 50 points total |
| • Model objects | 7 points |
| • JSON data | 5 points |
| • Environment wrapper and binding | 5 points |
| • Layout and composition | 7 points |
| • Colors and other visuals | 7 points |
| • Use of images, properly credited | 5 points |
| • Proper choice of input views and controls | 7 points |
| • At least one animation or transition | 4 points |
| • Custom app icon | 3 points |
| App description in _about.md_ | 5 points total |
| Insufficient differentiation from tutorial code | deduction only |
| Hard-to-maintain or error-prone code | deduction only |
| Hard-to-read code | deduction only |
| Version control | deduction only |
| Punctuality | deduction only |
| **Total** | **100** |

Note that inability to compile and run any code to begin with will negatively affect other criteria, because if we can’t run your code, we can’t evaluate related remaining items completely.


APP DESCRIPTION:

My app holds a collections of songs and their respective song charachteristics. The charachteristics were sourced off of spotify and included: Acousticness, Danceability, Energy, Instrumentalness,liveliness, loudnesss, and speechiness. The top level view of my app desplays the songs name, artist and length. You can filter through songs by filtering through various characteristics with sliders. Furthermore, songs can be liked in the detailed view and be filtered by liked songs. The detail view of the app contains some theory about the song including tempo and time signature, and a diagram depicting the relative characteristics of the song.




Image credits:
Iamsu!: https://tidal.com/browse/artist/5408159
Bryan Adams: https://www.theguardian.com/lifeandstyle/2022/dec/10/bryan-adams-interview
Britney Spears: https://www.harpersbazaar.com/celebrity/latest/a34113034/why-longtime-britney-spears-fans-are-demanding-to-freebritney/
Drake:https://www.popsugar.com/Drake
Exstortionist: https://www.facebook.com/ExtortionistBand/
Flatbush Zombies: https://www.gq.com/story/flatbush-zombies-are-not-trippin
James Blake: https://www.theguardian.com/music/2018/jul/03/james-blake-speaks-out-about-struggle-with-depression
Kano: https://www.festicket.com/artists/kano/
Pete Winfield:https://www.gettyimages.com/photos/pete-wingfield
