# (Custom) Solr for dotCloud

This is a re-implementation of the solr service using the custom build API.

## Usage (standalone)

    git clone git://github.com/jpetazzo/solr-on-dotcloud.git
    dotcloud push mysolr solr-on-dotcloud

## Usage (in your app)

Copy the solr directory at the top of your code repository.
Add the content of this recipe dotcloud.yml file to your dotcloud.yml file.

## Customization

You can modify solr/config to tweak the solr configuration (for solr experts).
You can modify solr/run to tweak the JVM parameters (e.g. if you scale
verticall and want to adapt the heap size).

## Migration from the standard solr service

Left as an exercise for the reader.

Hint: this recipe stores solr indexes in ~/data.



