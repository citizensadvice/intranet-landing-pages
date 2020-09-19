# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

config[:js_dir] = 'assets/javascripts'
config[:css_dir] = 'assets/stylesheets'
set :haml, { :format => :html5 }

# set :sass_assets_paths, [ 'node_modules', 'node_modules/@citizensadvice/design-system' ]
# Use webpack to build SCSS so we can use CA design system
# See: https://pspdfkit.com/blog/2018/using-webpack-with-middleman/
activate :external_pipeline,
  name: :webpack,
  command: build? ? 'npm run build' : 'npm run start',
  source: '.tmp/dist',
  latency: 1

activate :contentful do |f|
  f.space = { intranet: 'bryuf914fjzn' }
  f.access_token = 'UWvviXdfWTWkVhjcclzP03YE8-Ho8uNGfHADk-F921M'
  f.content_types = { pages: 'page' }
end

# Create a page for each contentful page
data.intranet.pages.each do |id, page|
  proxy "/#{page[:slug]}/index.html", "/page.html", :locals => { :page => page }, ignore: true
end

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
