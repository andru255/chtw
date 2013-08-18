define [
    'views/base/view'
    'text!templates/navigation.hbs'
], (View, template) ->
  'use strict'

  class NavigationView extends View
    clasName: 'navigate'
    listen:
      'change model': 'render'
      'navigation:change mediator': 'clearModel'
    region: 'navigation'
    tagName: 'nav'

    # Save the template string in a prototype property.
    # This is overwritten with the compiled template function.
    # In the end you might want to used precompiled templates.
    template: template
    template: null

    clearModel:(attrbs) ->
      @model.clear()
      @model.set attrbs


