window.MyApp ||= {}
class MyApp.Comments extends MyApp.Base
  constructor:() ->
    super  # call Base class for core functionality
    this   # and be sure to return this

  # now, we enumerate the actions for which we want page-specific behavior
  index:() ->
    console.log('I only print on the comments#index page')
  show:() ->
    alert "show this please!!"
    console.log('I only print on the comments#show page')
  edit:() ->
    # something special for the comments#edit page


