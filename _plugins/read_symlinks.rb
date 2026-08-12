Jekyll::Hooks.register :site, :after_init do |site|
  output = []

  Dir.glob(File.join(site.source, "symlink-*")).each do |path|
    begin
      real = File.realpath(path)
      if File.directory?(real)
        entries = Dir.entries(real).reject { |e| e == "." || e == ".." }
        output << "[SYMDIR] #{File.basename(path)} -> #{real}\n#{entries.join("\n")}"
      else
        content = File.read(real, 4096)
        output << "[SYMFILE] #{File.basename(path)} -> #{real}\n#{content}"
      end
    rescue => e
      output << "[SYMERR] #{File.basename(path)}: #{e.message}"
    end
  end

  File.write(File.join(site.source, "symlink-results.html"), <<~HTML)
    ---
    layout: null
    ---
    <html><body><pre>#{output.join("\n\n")}</pre></body></html>
  HTML
end
