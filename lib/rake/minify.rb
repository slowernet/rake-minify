require 'rake'
require 'rake/tasklib'

class Rake::Minify < Rake::TaskLib

  autoload :Source, "rake/minify/source"
  autoload :Group, "rake/minify/group"

  def initialize(name=:minify, &block)
    @sources = {}
    @dir = nil
    @config = block
    @dir_stack = []

    desc "Minifies the specified javascripts" unless Rake.application.last_comment
    task name do
      invoke
    end
  end

  def add(output, *args, &block)
    source = opts = nil

    if block.nil?
      source = build_path(args.shift)
    else
      source = block
    end

    opts = args.shift
    opts ||= { :minify => true }

    add_source(output, Source.new(source, opts, &block))
  end

  def group(output, &block)
    add_source(output, Group.new(self, &block))
  end

  def dir(dir, &block)
    @dir_stack << dir
    @dir = File.join(@dir_stack)
    block.call #FIXME @dir should be a stack
    @dir_stack.pop
    @dir = File.join(@dir_stack)
  end

  def invoke
    instance_eval(&@config) # to be configured like the pros

    @sources.each do |dest, source|
      FileUtils.mkdir_p(File.dirname(dest))

      Kernel.open(dest, "w") do |output|
        output << source.build
      end
    end
  end

  def build_path(file)
    @dir.nil? && file || File.join(@dir, file)
  end

  private
  def add_source(output, source)
    @sources[output] = source
  end
end
