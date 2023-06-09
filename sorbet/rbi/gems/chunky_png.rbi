# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/chunky_png/all/chunky_png.rbi
#
# chunky_png-1.4.0

module ChunkyPNG
  def self.Color(*args); end
  def self.Dimension(*args); end
  def self.Point(*args); end
  def self.Vector(*args); end
  def self.build_dimension_from_object(source); end
  def self.build_point_from_object(source); end
end
class ChunkyPNG::Datastream
  def chunks; end
  def data_chunks; end
  def data_chunks=(arg0); end
  def each_chunk; end
  def end_chunk; end
  def end_chunk=(arg0); end
  def header_chunk; end
  def header_chunk=(arg0); end
  def imagedata; end
  def initialize; end
  def metadata; end
  def other_chunks; end
  def other_chunks=(arg0); end
  def palette_chunk; end
  def palette_chunk=(arg0); end
  def physical_chunk; end
  def physical_chunk=(arg0); end
  def save(filename); end
  def self.from_blob(str); end
  def self.from_file(filename); end
  def self.from_io(io); end
  def self.from_string(str); end
  def self.verify_signature!(io); end
  def to_blob; end
  def to_s; end
  def to_string; end
  def transparency_chunk; end
  def transparency_chunk=(arg0); end
  def write(io); end
end
module ChunkyPNG::Chunk
  def self.read(io); end
  def self.read_bytes(io, length); end
  def self.verify_crc!(type, content, found_crc); end
end
class ChunkyPNG::Chunk::Base
  def initialize(type, attributes = nil); end
  def type; end
  def type=(arg0); end
  def write(io); end
  def write_with_crc(io, content); end
end
class ChunkyPNG::Chunk::Generic < ChunkyPNG::Chunk::Base
  def content; end
  def content=(arg0); end
  def initialize(type, content = nil); end
  def self.read(type, content); end
end
class ChunkyPNG::Chunk::Header < ChunkyPNG::Chunk::Base
  def color; end
  def color=(arg0); end
  def compression; end
  def compression=(arg0); end
  def content; end
  def depth; end
  def depth=(arg0); end
  def filtering; end
  def filtering=(arg0); end
  def height; end
  def height=(arg0); end
  def initialize(attrs = nil); end
  def interlace; end
  def interlace=(arg0); end
  def self.read(type, content); end
  def width; end
  def width=(arg0); end
end
class ChunkyPNG::Chunk::End < ChunkyPNG::Chunk::Base
  def content; end
  def initialize; end
  def self.read(type, content); end
end
class ChunkyPNG::Chunk::Palette < ChunkyPNG::Chunk::Generic
end
class ChunkyPNG::Chunk::Transparency < ChunkyPNG::Chunk::Generic
  def grayscale_entry(bit_depth); end
  def palette_alpha_channel; end
  def truecolor_entry(bit_depth); end
end
class ChunkyPNG::Chunk::ImageData < ChunkyPNG::Chunk::Generic
  def self.combine_chunks(data_chunks); end
  def self.split_in_chunks(data, level = nil, chunk_size = nil); end
end
class ChunkyPNG::Chunk::Text < ChunkyPNG::Chunk::Base
  def content; end
  def initialize(keyword, value); end
  def keyword; end
  def keyword=(arg0); end
  def self.read(type, content); end
  def value; end
  def value=(arg0); end
end
class ChunkyPNG::Chunk::CompressedText < ChunkyPNG::Chunk::Base
  def content; end
  def initialize(keyword, value); end
  def keyword; end
  def keyword=(arg0); end
  def self.read(type, content); end
  def value; end
  def value=(arg0); end
end
class ChunkyPNG::Chunk::Physical < ChunkyPNG::Chunk::Base
  def content; end
  def dpix; end
  def dpiy; end
  def initialize(ppux, ppuy, unit = nil); end
  def ppux; end
  def ppux=(arg0); end
  def ppuy; end
  def ppuy=(arg0); end
  def self.read(type, content); end
  def unit; end
  def unit=(arg0); end
end
class ChunkyPNG::Chunk::InternationalText < ChunkyPNG::Chunk::Base
  def compressed; end
  def compressed=(arg0); end
  def compression; end
  def compression=(arg0); end
  def content; end
  def initialize(keyword, text, language_tag = nil, translated_keyword = nil, compressed = nil, compression = nil); end
  def keyword; end
  def keyword=(arg0); end
  def language_tag; end
  def language_tag=(arg0); end
  def self.read(type, content); end
  def text; end
  def text=(arg0); end
  def translated_keyword; end
  def translated_keyword=(arg0); end
end
class ChunkyPNG::Palette < Set
  def [](index); end
  def best_color_settings; end
  def black_and_white?; end
  def can_decode?; end
  def can_encode?; end
  def determine_bit_depth; end
  def grayscale?; end
  def index(color); end
  def indexable?; end
  def initialize(enum, decoding_map = nil); end
  def opaque?; end
  def opaque_palette; end
  def self.from_canvas(canvas); end
  def self.from_chunks(palette_chunk, transparency_chunk = nil); end
  def self.from_pixels(pixels); end
  def to_plte_chunk; end
  def to_trns_chunk; end
end
module ChunkyPNG::Color
  def a(value); end
  def alpha_decomposable?(color, mask, bg, tolerance = nil); end
  def b(value); end
  def blend(fg, bg); end
  def compose(fg, bg); end
  def compose_precise(fg, bg); end
  def compose_quick(fg, bg); end
  def cylindrical_to_cubic(hue, saturation, y_component, chroma); end
  def decompose_alpha(color, mask, bg); end
  def decompose_alpha_component(channel, color, mask, bg); end
  def decompose_alpha_components(color, mask, bg); end
  def decompose_color(color, mask, bg, tolerance = nil); end
  def euclidean_distance_rgba(pixel_after, pixel_before); end
  def fade(color, factor); end
  def from_hex(hex_value, opacity = nil); end
  def from_hsb(hue, saturation, value, alpha = nil); end
  def from_hsl(hue, saturation, lightness, alpha = nil); end
  def from_hsv(hue, saturation, value, alpha = nil); end
  def from_rgb_stream(stream, pos = nil); end
  def from_rgba_stream(stream, pos = nil); end
  def fully_transparent?(value); end
  def g(value); end
  def grayscale(teint); end
  def grayscale?(value); end
  def grayscale_alpha(teint, a); end
  def grayscale_teint(color); end
  def html_color(color_name, opacity = nil); end
  def hue_and_chroma(color); end
  def int8_mult(a, b); end
  def interpolate_quick(fg, bg, alpha); end
  def opaque!(value); end
  def opaque?(value); end
  def parse(source); end
  def pass_bytesize(color_mode, depth, width, height); end
  def pixel_bitsize(color_mode, depth = nil); end
  def pixel_bytesize(color_mode, depth = nil); end
  def r(value); end
  def rgb(r, g, b); end
  def rgba(r, g, b, a); end
  def samples_per_pixel(color_mode); end
  def scanline_bytesize(color_mode, depth, width); end
  def to_grayscale(color); end
  def to_grayscale_alpha_bytes(color); end
  def to_grayscale_bytes(color); end
  def to_hex(color, include_alpha = nil); end
  def to_hsb(color, include_alpha = nil); end
  def to_hsl(color, include_alpha = nil); end
  def to_hsv(color, include_alpha = nil); end
  def to_truecolor_alpha_bytes(color); end
  def to_truecolor_bytes(color); end
  extend ChunkyPNG::Color
end
class ChunkyPNG::Point
  def <=>(other); end
  def ==(other); end
  def eql?(other); end
  def initialize(x, y); end
  def to_a; end
  def to_ary; end
  def within_bounds?(*dimension_like); end
  def x; end
  def x=(arg0); end
  def y; end
  def y=(arg0); end
end
class ChunkyPNG::Vector
  def ==(other); end
  def [](index); end
  def dimension; end
  def each(&block); end
  def each_edge(close = nil); end
  def edges(close = nil); end
  def eql?(other); end
  def height; end
  def initialize(points = nil); end
  def length; end
  def max_x; end
  def max_y; end
  def min_x; end
  def min_y; end
  def offset; end
  def points; end
  def self.multiple_from_array(source); end
  def self.multiple_from_string(source_str); end
  def width; end
  def x_range; end
  def y_range; end
  include Enumerable
end
class ChunkyPNG::Dimension
  def <=>(other); end
  def ==(other); end
  def area; end
  def eql?(other); end
  def hash; end
  def height; end
  def height=(arg0); end
  def include?(*point_like); end
  def initialize(width, height); end
  def to_a; end
  def to_ary; end
  def width; end
  def width=(arg0); end
end
class ChunkyPNG::Canvas
  def ==(other); end
  def [](x, y); end
  def []=(x, y, color); end
  def area; end
  def assert_height!(vector_length); end
  def assert_size!(matrix_width, matrix_height); end
  def assert_width!(vector_length); end
  def assert_x!(x); end
  def assert_xy!(x, y); end
  def assert_y!(y); end
  def column(x); end
  def dimension; end
  def eql?(other); end
  def get_pixel(x, y); end
  def height; end
  def include?(*point_like); end
  def include_point?(*point_like); end
  def include_x?(x); end
  def include_xy?(x, y); end
  def include_y?(y); end
  def initialize(width, height, initial = nil); end
  def initialize_copy(other); end
  def inspect; end
  def palette; end
  def pixels; end
  def replace_canvas!(new_width, new_height, new_pixels); end
  def replace_column!(x, vector); end
  def replace_row!(y, vector); end
  def row(y); end
  def self.from_canvas(canvas); end
  def set_pixel(x, y, color); end
  def set_pixel_if_within_bounds(x, y, color); end
  def to_image; end
  def width; end
  extend ChunkyPNG::Canvas::Adam7Interlacing
  extend ChunkyPNG::Canvas::DataUrlImporting
  extend ChunkyPNG::Canvas::PNGDecoding
  extend ChunkyPNG::Canvas::StreamImporting
  include ChunkyPNG::Canvas::DataUrlExporting
  include ChunkyPNG::Canvas::Drawing
  include ChunkyPNG::Canvas::Masking
  include ChunkyPNG::Canvas::Operations
  include ChunkyPNG::Canvas::PNGEncoding
  include ChunkyPNG::Canvas::Resampling
  include ChunkyPNG::Canvas::StreamExporting
end
module ChunkyPNG::Canvas::PNGEncoding
  def determine_png_encoding(constraints = nil); end
  def encode_png_image_pass_to_stream(stream, color_mode, bit_depth, filtering); end
  def encode_png_image_with_interlacing(color_mode, bit_depth = nil, filtering = nil); end
  def encode_png_image_without_interlacing(color_mode, bit_depth = nil, filtering = nil); end
  def encode_png_pixels_to_scanline_grayscale_1bit(pixels); end
  def encode_png_pixels_to_scanline_grayscale_2bit(pixels); end
  def encode_png_pixels_to_scanline_grayscale_4bit(pixels); end
  def encode_png_pixels_to_scanline_grayscale_8bit(pixels); end
  def encode_png_pixels_to_scanline_grayscale_alpha_8bit(pixels); end
  def encode_png_pixels_to_scanline_indexed_1bit(pixels); end
  def encode_png_pixels_to_scanline_indexed_2bit(pixels); end
  def encode_png_pixels_to_scanline_indexed_4bit(pixels); end
  def encode_png_pixels_to_scanline_indexed_8bit(pixels); end
  def encode_png_pixels_to_scanline_method(color_mode, depth); end
  def encode_png_pixels_to_scanline_truecolor_8bit(pixels); end
  def encode_png_pixels_to_scanline_truecolor_alpha_8bit(pixels); end
  def encode_png_pixelstream(color_mode = nil, bit_depth = nil, interlace = nil, filtering = nil); end
  def encode_png_str_scanline_average(stream, pos, prev_pos, line_width, pixel_size); end
  def encode_png_str_scanline_none(stream, pos, prev_pos, line_width, pixel_size); end
  def encode_png_str_scanline_paeth(stream, pos, prev_pos, line_width, pixel_size); end
  def encode_png_str_scanline_sub(stream, pos, prev_pos, line_width, pixel_size); end
  def encode_png_str_scanline_up(stream, pos, prev_pos, line_width, pixel_size); end
  def encoding_palette; end
  def encoding_palette=(arg0); end
  def save(filename, constraints = nil); end
  def to_blob(constraints = nil); end
  def to_datastream(constraints = nil); end
  def to_s(constraints = nil); end
  def to_string(constraints = nil); end
  def write(io, constraints = nil); end
end
module ChunkyPNG::Canvas::PNGDecoding
  def decode_png_extract_1bit_value(byte, index); end
  def decode_png_extract_2bit_value(byte, index); end
  def decode_png_extract_4bit_value(byte, index); end
  def decode_png_image_pass(stream, width, height, color_mode, depth, start_pos, decoding_palette); end
  def decode_png_pixels_from_scanline_grayscale_16bit(stream, pos, width, _decoding_palette); end
  def decode_png_pixels_from_scanline_grayscale_1bit(stream, pos, width, _decoding_palette); end
  def decode_png_pixels_from_scanline_grayscale_2bit(stream, pos, width, _decoding_palette); end
  def decode_png_pixels_from_scanline_grayscale_4bit(stream, pos, width, _decoding_palette); end
  def decode_png_pixels_from_scanline_grayscale_8bit(stream, pos, width, _decoding_palette); end
  def decode_png_pixels_from_scanline_grayscale_alpha_16bit(stream, pos, width, _decoding_palette); end
  def decode_png_pixels_from_scanline_grayscale_alpha_8bit(stream, pos, width, _decoding_palette); end
  def decode_png_pixels_from_scanline_indexed_1bit(stream, pos, width, decoding_palette); end
  def decode_png_pixels_from_scanline_indexed_2bit(stream, pos, width, decoding_palette); end
  def decode_png_pixels_from_scanline_indexed_4bit(stream, pos, width, decoding_palette); end
  def decode_png_pixels_from_scanline_indexed_8bit(stream, pos, width, decoding_palette); end
  def decode_png_pixels_from_scanline_method(color_mode, depth); end
  def decode_png_pixels_from_scanline_truecolor_16bit(stream, pos, width, _decoding_palette); end
  def decode_png_pixels_from_scanline_truecolor_8bit(stream, pos, width, _decoding_palette); end
  def decode_png_pixels_from_scanline_truecolor_alpha_16bit(stream, pos, width, _decoding_palette); end
  def decode_png_pixels_from_scanline_truecolor_alpha_8bit(stream, pos, width, _decoding_palette); end
  def decode_png_pixelstream(stream, width, height, color_mode, depth, interlace, decoding_palette, transparent_color); end
  def decode_png_resample_16bit_value(value); end
  def decode_png_resample_1bit_value(value); end
  def decode_png_resample_2bit_value(value); end
  def decode_png_resample_4bit_value(value); end
  def decode_png_resample_8bit_value(value); end
  def decode_png_str_scanline(stream, pos, prev_pos, line_length, pixel_size); end
  def decode_png_str_scanline_average(stream, pos, prev_pos, line_length, pixel_size); end
  def decode_png_str_scanline_paeth(stream, pos, prev_pos, line_length, pixel_size); end
  def decode_png_str_scanline_sub(stream, pos, prev_pos, line_length, pixel_size); end
  def decode_png_str_scanline_sub_none(stream, pos, prev_pos, line_length, pixel_size); end
  def decode_png_str_scanline_up(stream, pos, prev_pos, line_length, pixel_size); end
  def decode_png_with_adam7_interlacing(stream, width, height, color_mode, depth, decoding_palette); end
  def decode_png_without_interlacing(stream, width, height, color_mode, depth, decoding_palette); end
  def from_blob(str); end
  def from_datastream(ds); end
  def from_file(filename); end
  def from_io(io); end
  def from_stream(io); end
  def from_string(str); end
end
module ChunkyPNG::Canvas::Adam7Interlacing
  def adam7_extract_pass(pass, canvas); end
  def adam7_merge_pass(pass, canvas, subcanvas); end
  def adam7_multiplier_offset(pass); end
  def adam7_pass_size(pass, original_width, original_height); end
  def adam7_pass_sizes(original_width, original_height); end
end
module ChunkyPNG::Canvas::StreamExporting
  def to_abgr_stream; end
  def to_alpha_channel_stream; end
  def to_grayscale_stream; end
  def to_rgb_stream; end
  def to_rgba_stream; end
end
module ChunkyPNG::Canvas::StreamImporting
  def from_abgr_stream(width, height, stream); end
  def from_bgr_stream(width, height, stream); end
  def from_rgb_stream(width, height, stream); end
  def from_rgba_stream(width, height, stream); end
end
module ChunkyPNG::Canvas::DataUrlExporting
  def to_data_url; end
end
module ChunkyPNG::Canvas::DataUrlImporting
  def from_data_url(string); end
end
module ChunkyPNG::Canvas::Operations
  def border!(size, color = nil); end
  def border(size, color = nil); end
  def check_size_constraints!(other, offset_x, offset_y); end
  def compose!(other, offset_x = nil, offset_y = nil); end
  def compose(other, offset_x = nil, offset_y = nil); end
  def crop!(x, y, crop_width, crop_height); end
  def crop(x, y, crop_width, crop_height); end
  def flip!; end
  def flip; end
  def flip_horizontally!; end
  def flip_horizontally; end
  def flip_vertically!; end
  def flip_vertically; end
  def grayscale!; end
  def grayscale; end
  def mirror!; end
  def mirror; end
  def replace!(other, offset_x = nil, offset_y = nil); end
  def replace(other, offset_x = nil, offset_y = nil); end
  def rotate_180!; end
  def rotate_180; end
  def rotate_clockwise!; end
  def rotate_clockwise; end
  def rotate_counter_clockwise!; end
  def rotate_counter_clockwise; end
  def rotate_left!; end
  def rotate_left; end
  def rotate_right!; end
  def rotate_right; end
  def trim!(border = nil); end
  def trim(border = nil); end
end
module ChunkyPNG::Canvas::Drawing
  def bezier_curve(points, stroke_color = nil); end
  def binomial_coefficient(n, k); end
  def circle(x0, y0, radius, stroke_color = nil, fill_color = nil); end
  def compose_pixel(x, y, color); end
  def compose_pixel_unsafe(x, y, color); end
  def line(x0, y0, x1, y1, stroke_color, inclusive = nil); end
  def line_xiaolin_wu(x0, y0, x1, y1, stroke_color, inclusive = nil); end
  def polygon(path, stroke_color = nil, fill_color = nil); end
  def rect(x0, y0, x1, y1, stroke_color = nil, fill_color = nil); end
end
module ChunkyPNG::Canvas::Resampling
  def resample(new_width, new_height); end
  def resample_bilinear!(new_width, new_height); end
  def resample_bilinear(new_width, new_height); end
  def resample_nearest_neighbor!(new_width, new_height); end
  def resample_nearest_neighbor(new_width, new_height); end
  def resize(new_width, new_height); end
  def steps(width, new_width); end
  def steps_residues(width, new_width); end
end
module ChunkyPNG::Canvas::Masking
  def change_mask_color!(new_color); end
  def change_theme_color!(old_theme_color, new_theme_color, bg_color = nil, tolerance = nil); end
  def extract_mask(mask_color, bg_color = nil, tolerance = nil); end
end
class ChunkyPNG::Image < ChunkyPNG::Canvas
  def initialize(width, height, bg_color = nil, metadata = nil); end
  def initialize_copy(other); end
  def metadata; end
  def metadata=(arg0); end
  def metadata_chunks; end
  def self.from_datastream(ds); end
  def to_datastream(constraints = nil); end
end
class ChunkyPNG::Exception < StandardError
end
class ChunkyPNG::NotSupported < ChunkyPNG::Exception
end
class ChunkyPNG::SignatureMismatch < ChunkyPNG::Exception
end
class ChunkyPNG::CRCMismatch < ChunkyPNG::Exception
end
class ChunkyPNG::InvalidUTF8 < ChunkyPNG::Exception
end
class ChunkyPNG::ExpectationFailed < ChunkyPNG::Exception
end
class ChunkyPNG::OutOfBounds < ChunkyPNG::ExpectationFailed
end
class ChunkyPNG::UnitsUnknown < ChunkyPNG::Exception
end
