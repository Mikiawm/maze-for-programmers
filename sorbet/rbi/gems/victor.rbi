# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/victor/all/victor.rbi
#
# victor-0.3.4

module Victor
end
class Victor::SVGBase
  def <<(additional_content); end
  def append(additional_content); end
  def build(&block); end
  def content; end
  def css(defs = nil); end
  def css=(defs); end
  def element(name, value = nil, attributes = nil, &_block); end
  def glue; end
  def glue=(arg0); end
  def initialize(attributes = nil, &block); end
  def render(template: nil, glue: nil); end
  def save(filename, template: nil, glue: nil); end
  def setup(attributes = nil); end
  def svg_attributes; end
  def svg_template; end
  def template; end
  def template=(arg0); end
  def template_path; end
  def to_s; end
end
class Victor::SVG < Victor::SVGBase
  def method_missing(method_sym, *arguments, &block); end
end
class Victor::Attributes
  def [](key); end
  def []=(key, value); end
  def attributes; end
  def initialize(attributes = nil); end
  def to_s; end
  def to_style; end
end
class Victor::CSS
  def attributes; end
  def convert_hash(hash, indent = nil); end
  def css_block(key, value, indent); end
  def initialize(attributes = nil); end
  def render; end
  def to_s; end
end
module Victor::DSL
  def append(*args, **, &block); end
  def build(*args, **, &block); end
  def css(*args, **, &block); end
  def element(*args, **, &block); end
  def render(*args, **, &block); end
  def save(*args, **, &block); end
  def setup(*args, **, &block); end
  def svg; end
  extend Forwardable
end