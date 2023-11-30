<<<<<<< HEAD
**CMSI 2022** Mobile Application Development, Spring 2023

# Assignment 0412
With this assignment, we fill out the stack, transitioning from using someone else’s web services to building your own. There are many ways to do this, and for this course, we have chosen [Firebase](https://firebase.google.com) to introduce you to these layers. As with any back-end development, with Firebase we hope you’ll demonstrate:
* The ability to set up and configure a Firebase project
* The ability to hook up a database (in this case Firestore) to an iOS SwiftUI mobile application
* The ability to enable and use one or more authentication methods
* The ability to set up Firebase security policies
* Continued advancement in SwiftUI app development

## Background Reading
All prior documentation continues to be useful here. The [iOS Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/) merit explicit mention again, particularly as you encounter more mobile app use cases, features, and interactions.

It should be no surprise that the big additions to the document pile involve Firebase:
* https://firebase.google.com/docs/ios/setup: Setting up Firebase for iOS
* https://firebase.google.com/docs/auth: Introduction to Firebase authentication
* https://firebase.google.com/docs/firestore: Introduction to Firestore
* https://firebase.google.com/docs/rules: Introduction to Firebase security rules
* [Swift Package Manager](https://github.com/firebase/firebase-ios-sdk/blob/master/SwiftPackageManager.md) is the recommended mechanism for adding Firebase libraries to your Xcode project
* The main Firebase package is the Firebase iOS SDK: Keep these [iOS/Swift reference documentation](https://firebase.google.com/docs/reference/swift/firebasecore/api/reference/Classes) and [GitHub repository](https://github.com/firebase/firebase-ios-sdk) links handy
* Another useful package (especially for authentication) is FirebaseUI: Here is its [GitHub repository](https://github.com/firebase/FirebaseUI-iOS) and [documentation for sign-in](https://firebase.google.com/docs/auth/ios/firebaseui)
* NetNinja has a [Firebase Firestore tutorial playlist](https://www.youtube.com/playlist?list=PL4cUxeGkcC9itfjle0ji1xOZ2cjRGY_WB) that is web/JavaScript-centric—still, the concepts are the same; you’ll just have to convert their code examples to the [iOS/Swift equivalents](https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes)

Note that not all Firebase documentation is consistently up-to-date—some docs will reference older technologies and if so, some work may be involved in adapting those to our current stack. Remember that we are in the world of _SwiftUI_ apps—you may see references to other frameworks such as UIKit, Storyboard, Interface Builder, and others. Note also that Swift Package Manager is relatively new; the iOS ecosystem used to rely on third-party solutions such as CocoaPods or Carthage for package management. Some Firebase docs still refer to those, and if you see that, make sure stay with Swift Package Manager instead.

## For Submission
Create a blog mobile app using Firestore for persistence and Firebase Auth for authentication. You have been given a [starter/sample bare-bones blog app project](https://classroom.github.com/a/rk1OqpJQ) but you are under no obligation to use that code as given—feel free to pick and choose from it to build a blog app your way. Make it as amazing as can be in terms of features and look-and-feel. Explore the possibilities—unleash your creativity!

Make sure that your blog app goes _well beyond_ the given bare-bones version: note that this is _not_ a suggestion; it’s a requirement 😈 Some ideas:
* Expand article data: lots of potential here, such as adding tags, categories, loglines, sectioning, etc.—all of these will require deeper knowledge of the [Firestore data model](https://firebase.google.com/docs/firestore/data-model)
* Filter/search articles: welcome to the world of [querying](https://firebase.google.com/docs/firestore/query-data/queries)
* Categorize/group articles: yes, still querying, with some [ordering and limits](https://firebase.google.com/docs/firestore/query-data/order-limit-data)
* Page through articles: [actually a necessity](https://firebase.google.com/docs/firestore/query-data/query-cursors) as your article counts grow—with some interesting user interface options though, ranging from classic previous/next buttons to [infinite scroll](https://swiftuirecipes.com/blog/infinite-scroll-list-in-swiftui)
* Update articles: similarly, this corresponds to [updating documents](https://firebase.google.com/docs/firestore/manage-data/add-data#update-data)
* Delete articles: that’s a specific case of [deleting data](https://firebase.google.com/docs/firestore/manage-data/delete-data)
* Allow photo uploads or attachments: you will want to learn about [Firebase Storage](https://firebase.google.com/docs/storage/ios/start) on the back end and [image access](https://www.hackingwithswift.com/books/ios-swiftui/importing-an-image-into-swiftui-using-phpickerviewcontroller) on the front end
* Add user metadata (e.g., photos, profile, links, etc.): just a specific case of expanding your document structure, but this one may involve [additional collections and more documents](https://firebase.google.com/docs/firestore/data-model#collections)
* Implement rich text editing: this one is a [SwiftUI deep dive](https://betterprogramming.pub/how-to-implement-a-wysiwyg-editor-in-swiftui-c60236749943) but may be worth it
* Support Touch ID/Face ID: this breaks you away from the premade FirebaseUI views into [direct invocation of Firebase authentication functions](https://firebase.google.com/docs/auth/ios/start) which you would call after [using Touch ID or Face ID](https://developer.apple.com/documentation/localauthentication/logging_a_user_into_your_app_with_face_id_or_touch_id) with [SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/using-touch-id-and-face-id-with-swiftui). This can go [quite deep if you want a completely secure solution](https://developer.apple.com/documentation/localauthentication#overview)—for this assignment, it’s OK to go with something rudimentary (though it won’t hurt to read through that last link to get the big picture)
* Support [links in articles](https://www.appcoda.com/swiftui-wkwebview/) that go to the web browser or an embedded web view
* Support additional methods, whether [via FirebaseUI](https://firebase.google.com/docs/auth/ios/firebaseui#set_up_sign-in_methods) or [through direct SDK calls](https://firebase.google.com/docs/auth/ios/start#next_steps)—note that some of these will require additional configuration or packages

Add _at least three (3)_ features beyond what is provided by the starter blog app. Additional features will earn extra credit based on the sophistication of those features.

As you can see above, starter links for these features are provided but don’t hesitate to find others. As always, if you use any content directly from a source, _make sure to credit the source_. Note also that there isn’t enough time to cover all of these in class so some self-study will be called for. This is by design because it corresponds to what one typically does in industry or research.

Notice how the Firebase SDKs abstract out the inner details of interacting with Firebase and expose Firebase functionality to your mobile app by way of “plain” classes, objects, methods, and functions. This can be viewed as a “professional example” of what you were asked to do with your generic API network code. Similarly, you will also be best off if you abstract the _Firebase functionality_ away from the rest of your app code. This puts you in a position to transition away more easily in case you change your back end to something other than Firebase.

As before, continue to reinforce and build upon the skills you have already learned:
* Use of model objects to separate data from presentation—now matched up to your Firebase Firestore documents!
* Retrieval from and interaction with the Firebase back end
* Abstraction of Firebase operations behind classes, objects, methods, and functions (async where appropriate)
* Appropriate user interface feedback for operations-in-progress
* Correct error handling with messaging to the user when appropriate
* Effective layout via proper composition of stacks, spacers, padding, and other SwiftUI features
* Appealing color choices and visuals—demonstrate your mastery of views and their properties (without violating any iOS Human Interface Guidelines 😅)
* Proper choice of input views and controls
* Well-chosen animations or transitions beyond the standard SwiftUI view behaviors
* Well-chosen programmed graphics using paths, gradients, and related functions
* Custom app icon

Supply a simple _about.md_ Markdown file that describes your blog app briefly. Make sure to _state and elaborate on the three (3) or more features_ that go beyond the bare bones starter/sample code. Also include a copy of the _production_ security policy that you implemented for your database.

## Operational Tips/Suggestions
* Note again that the wealth of possibilities means that self-study and experimentation are built into the work involved with this assignment. Make sure to plan accordingly! If you are partnered up, learning the material together may help, with multiple eyes looking at the same documentation
* Take advantage of the very distinct layers involved here: the back end (Firebase) and the front end (SwiftUI). To keep the learning manageable, try to look at each layer in isolation—see if you can first get the Firebase side to work without any visual interface, possibly just printing things and/or inspecting the Firebase Console. _Then_ build the user interface on top of it knowing that the back end functionality already works. Or vice versa, if the user interface part looks tricker
* You may make mistakes, change your mind about features, or run into a dead end, all of which will take time—ideally, _build that time in_ when planning out how you will work on the app
* Many operational tips and suggestions from the past assignments also still apply—don’t hestitate to review them!

### Initial setup: Unifying your GitHub and Xcode repositories
Presumably the third time’s the charm here and this is fairly routine, but for completeness this section is copied from the first assignment’s instructions, and remains relevant if you need to merge an Xcode-created _git_ repository and the GitHub Classroom assignment repo so it is reproduced here.

> The repository for this assignment comes _only_ with this _README.md_ by design, so that you can go through the motions of creating the app project in Xcode yourself. Checking _Create Git repository on my Mac_ will set things up properly but as a _separate_ repository from the one that you get with the assignment, and it takes some specialized _git_ commands to “cross the streams” successfully 👻
>
> So, instead of the usual `git clone` command, do the following:
> 1. Create your initial Xcode project on your machine with the _Create Git repository on my Mac_ option checked
> 2. Acquire the URL of your assignment repository from the green `Code` button on GitHub—let’s call this `YOUR_REMOTE_URL` (this is also what you would do before doing an initial `git clone`, but in this case we will do something different with it—read on)
> 3. Make sure that you don’t have any pending changes on your Xcode project—if so, commit them
> 4. From the command line, `cd` into your Xcode project’s folder and type the following three commands:
>
> ```
> git remote add origin YOUR_REMOTE_URL
> git pull origin main --allow-unrelated-histories
> git branch --set-upstream-to=origin/main main
> ```
>
> (don’t forget to substitute `YOUR_REMOTE_URL` above for the specific URL of your GitHub repository)
>
> That should do it! The repository created by Xcode and the assignment repository that GitHub Classroom gave you should now be “as one.” You should now be able to use _git_ on this folder as if you had `git clone`-d it normally.

Because you will have already done this at least once from the prior assignment, you should no longer see the “You have divergent branches…” message upon doing the `git pull`, but if you do, invoke `git config pull.rebase false` then attempt the `pull` again.

And remember that <kbd>:</kbd><kbd>w</kbd><kbd>q</kbd><kbd>⏎</kbd> is the key sequence that gets you out of the _vi_ auto-generated commit message display, in case that comes up.

## How to Turn it In
Commit the following to your repository:
- Complete Xcode project with all code, raw data, and assets
- Firebase configuration file (or else we won’t be able to run your app!)
- _about.md_ file describing your blog app and the three (3) features that you implemented and including a copy of the production security policy of the database

## Specific Point Allocations
For this particular assignment, graded categories are as follows:

| Category | Points |
| -------- | -----: |
| Baseline functionality | 12 points total |
| • Authentication | 4 points |
| • Firestore | 4 points |
| • Security | 4 points |
| Three (3) features beyond Bare Bones Blog | 12 points each, 36 points total |
| Implementation specifications | 44 points total |
| • Model objects | 4 points |
| • Interaction with Firebase | 4 points |
| • Abstraction of Firebase functionality | 8 points |
| • Feedback for operations-in-progress | 4 points |
| • Error handling and messaging | 4 points |
| • Layout and composition | 4 points |
| • Colors and other visuals | 4 points |
| • Proper choice of input views and controls | 4 points |
| • Well-chosen animations or transitions | 4 points |
| • Well-chosen programmed graphics | 3 points |
| • Custom app icon | 1 point |
| • Credits where appropriate | deduction only (if not done) |
| Blog app description in _about.md_ | 8 points total |
| • About the three (3) added features | 6 points |
| • Production security policy | 2 points |
| Hard-to-maintain or error-prone code | deduction only |
| Hard-to-read code | deduction only |
| Version control | deduction only |
| Punctuality | deduction only |
| **Total** | **100** |

Note that inability to compile and run any code to begin with will negatively affect other criteria, because if we can’t run your code, we can’t evaluate related remaining items completely.
=======
USE THIS TEST ACOUNT (has previous submissiopn since you can only submit one a day)

gmail: LMUappdevtest@gmail.com
password: lmuappdevtest123

Description:

This firestore backed app has a survey that can be filled and submitted once per day. The survey can be found on the today tab. on the "See ho others are doing tab" tere is a date selector to see a sample of the surveys submitted on that day. On the "looking back" tab there is an overview of the previous scores in each section
>>>>>>> 15c9dac (done)
