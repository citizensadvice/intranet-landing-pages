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
set :markdown_engine, :redcarpet

# set :sass_assets_paths, [ 'node_modules', 'node_modules/@citizensadvice/design-system' ]
# Use webpack to build SCSS so we can use CA design system
# See: https://pspdfkit.com/blog/2018/using-webpack-with-middleman/
activate :external_pipeline,
  name: :webpack,
  command: build? ? 'npm run build' : 'npm run start',
  source: '.tmp/dist',
  latency: 1

config[:http_prefix] = '/intranet'
config[:relative_assets] = true
config[:relative_links] = true
