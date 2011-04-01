require 'fileutils'
require 'tmpdir'
require 'rake'

Given /^we want to minify the js file "([^"]*)" into "([^"]*)"$/ do |file, output|
  add_to_groups(output, true, file)
end

When /^I run rake minify$/ do
  @dir = Dir.mktmpdir
  FileUtils.mkdir File.join(@dir, basedir) if basedir.size > 0
  Dir.glob(File.join(File.dirname(__FILE__), "..", "js-sources", "*")) do |file|
    FileUtils.cp(file, File.join(@dir, basedir))
  end
  rakefile = File.join(@dir, "Rakefile")
  open(rakefile, "w") { |io| io << generate_rakefile }
  
  application = Rake::Application.new
  Rake.application = application
  application.add_import(rakefile)
  application.load_imports
  FileUtils.cd(@dir) do
    application["minify"].invoke
  end
end

Then /^"([^"]*)" should be minified$/ do |file|
  open(File.join(@dir, basedir, file)) do |result|
    open(File.join(File.dirname(__FILE__), "..", "js-expected", file)) do |expected|
      (result.read + "\n").should == expected.read
    end
  end
end

Given /^we want to combine the js file "([^"]*)" into "([^"]*)"$/ do |file, output|
  add_to_groups(output, false, file)
end

Then /^"([^"]*)" should include "([^"]*)" and "([^"]*)"$/ do |result, source1, source2|
  sources = [source1, source2].map do |s|
    file = File.join(File.dirname(__FILE__), "..", "js-expected", s)
    unless File.exists? file
      file = File.join(File.dirname(__FILE__), "..", "js-sources", s)
    end

    open(file) do |e|
      e.read
    end
  end

  open(File.join(@dir, basedir, result)) do |result|
    content = result.read
    sources.each { |s| content.should include(s.gsub(/\n$/,'')) } # this is unfortunate :/
  end
end

Given /^the basedir "([^"]*)"$/ do |dir|
  basedir(dir)
end
