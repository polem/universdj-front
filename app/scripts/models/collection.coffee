class window.Collection
    constructor: (type, items) ->
        modelFactory = new ModelFactory()

        angular.forEach(items, (item) ->
            item = modelFactory.create(type, item)
        )

        @items = items

        return items
