class window.ModelFactory
    create: (type, data) ->
        switch type
            when 'mixshow' then return new Mixshow(data)
            when 'episode' then return new Episode(data)
