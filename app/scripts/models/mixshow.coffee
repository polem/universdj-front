class window.Mixshow extends Model
    constructor: (data) ->
        data.type = 'mixshow'
        super data

    toString: () ->
        return @name
