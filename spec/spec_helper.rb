# frozen_string_literal: true

require "bridgetown"
require File.expand_path("../lib/dragonfly_thumbnailer", __dir__)

Bridgetown.logger.log_level = :error

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = "random"

  ROOT_DIR = File.expand_path("fixtures", __dir__)
  puts ROOT_DIR
  SOURCE_DIR = File.join(ROOT_DIR, "src")
  DEST_DIR   = File.expand_path("dest", __dir__)
  puts DEST_DIR

  def root_dir(*files)
    File.join(ROOT_DIR, *files)
  end

  def source_dir(*files)
    File.join(SOURCE_DIR, *files)
  end

  def dest_dir(*files)
    File.join(DEST_DIR, *files)
  end

  def make_context(registers = {})
    Liquid::Context.new({}, {}, { :site => site }.merge(registers))
  end
end
