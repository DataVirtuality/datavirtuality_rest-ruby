# Data Virtuaity REST Client

Easy way to retrieve data from your Data Virtuality server via the REST API to consume data in any Ruby application.

## Installation

Add this line to your application's Gemfile:

    gem 'datavirtuality_rest'

And then execute:

    $ bundle

Or install it manually:

    $ gem install datavirtuality_rest

## Usage Examples

First instantiate your client by specifying the server URL, username and password:

    > client = DataVirtuality::Rest.new('http://127.0.0.1:8080', '<USER NAME>', '<PASSWORD>')

Now you can retrieve data in two ways:

1. Read a full table or view by specifying the full schema and path, separated by a slash:

        > client.get('views/demo_view')
        => [{:id=>"438256", :date=>"2017-04-01", :hits=>331}, {:id=>"438918", :date=>"2017-04-01", :hits=>314}]


2. Specify a custom SQL query to gain full flexibility:

        > client.query('SELECT * FROM views.demo_view')
        => [{:id=>"438918", :date=>"2017-04-01", :hits=>886}, {:id=>"431936", :date=>"2017-02-02", :hits=>389}])

## Contributing

Are you using Ruby to access data from Data Virtuality? Do you have any feedback or are you missing additional functionality? Just let us know by creating an issue or pull request to get in touch with us.
