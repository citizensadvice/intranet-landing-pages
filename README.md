# Citizens Advice Intranet
Static site generated landing page for the digital workplace.

This is intended for temporary use, enabling the digital workplace team to test
changes to the language and design, before the new intranet is properly built out.

## How it works
The code repository separates the content from the layout and styling, then
joins it all together using a static site generator called [middleman][middleman].

### Making changes
The content for the website is stored in text files in this code repository. You
can [edit them using the GitHub interface][editing].

- The main content of the landing page is in [index.html.md.erb](source/index.html.md.erb). You can use [markdown][markdown] or HTML.
- The menu items are in [menu.yml](data/menu.yml). Be careful with the indentation.

## Local development
### Installation
Dependencies: Ruby 2.7, Bundler, and Node.js

- Install Ruby dependencies via `bundle install`
- Install Node.js dependencies via `npm install`

### Usage

To run a development server, use:

```
bundle exec middleman server
```

To build for production, use:

```
bundle exec middleman build
```

Both of these commands will run the equivalent Node.js commands, as specified
in the `external_pipeline` section of [`config.rb`](config.rb).

The middleman configuration is mostly out-of-the-box, except we switched to using
webpack to compile the CSS and JavaScript—following [this guide][webpack-middleman]—so
that we can import the [CA design system][design-system] via npm.

[middleman]: https://middlemanapp.com/
[editing]: https://docs.github.com/en/github/managing-files-in-a-repository/editing-files-in-your-repository
[markdown]: https://guides.github.com/features/mastering-markdown/
[webpack-middleman]: https://pspdfkit.com/blog/2018/using-webpack-with-middleman/
[design-system]: https://github.com/citizensadvice/design-system
