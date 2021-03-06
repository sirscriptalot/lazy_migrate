# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/tty-prompt/all/tty-prompt.rbi
#
# tty-prompt-0.22.0

module TTY
end
class TTY::Prompt
  def active_color; end
  def ask(message = nil, **options, &block); end
  def clear_line(*args, &block); end
  def clear_lines(*args, &block); end
  def collect(**options, &block); end
  def count_screen_lines(*args, &block); end
  def cursor; end
  def debug(*messages); end
  def decorate(string, *colors); end
  def enabled_color; end
  def enum_select(question, *args, &block); end
  def error(*args, **options); end
  def error_color; end
  def expand(message, *args, &block); end
  def flush(*args, &block); end
  def help_color; end
  def hide(*args, &block); end
  def initialize(input: nil, output: nil, env: nil, symbols: nil, prefix: nil, interrupt: nil, track_history: nil, quiet: nil, enable_color: nil, active_color: nil, help_color: nil, error_color: nil); end
  def input; end
  def inspect; end
  def invoke_question(object, message, **options, &block); end
  def invoke_select(object, question, *args, &block); end
  def keypress(message = nil, **options, &block); end
  def mask(message = nil, **options, &block); end
  def multi_select(question, *args, &block); end
  def multiline(message = nil, **options, &block); end
  def no?(message, **options, &block); end
  def ok(*args, **options); end
  def on(*args, &block); end
  def output; end
  def prefix; end
  def print(*args, &block); end
  def puts(*args, &block); end
  def quiet; end
  def read_char(*args, &block); end
  def read_keypress(*args, &block); end
  def read_line(*args, &block); end
  def read_multiline(*args, &block); end
  def reader; end
  def say(message = nil, **options); end
  def select(question, *args, &block); end
  def self.messages; end
  def show(*args, &block); end
  def slider(question, **options, &block); end
  def stderr; end
  def stdin; end
  def stdout; end
  def strip(*args, &block); end
  def subscribe(*args, &block); end
  def suggest(message, possibilities, **options); end
  def symbols; end
  def trigger(*args, &block); end
  def tty?; end
  def unsubscribe(*args, &block); end
  def warn(*args, **options); end
  def yes?(message, **options, &block); end
  extend Forwardable
end
class TTY::Prompt::AnswersCollector
  def add_answer(answer); end
  def call(&block); end
  def create_collector; end
  def initialize(prompt, **options); end
  def key(name, &block); end
  def method_missing(method, *args, **options, &block); end
  def values(&block); end
end
module TTY::Prompt::Const
end
class TTY::Prompt::ConverterRegistry
  def [](name); end
  def contain?(name); end
  def fetch(name); end
  def initialize(registry = nil); end
  def inspect; end
  def keys(*args, &block); end
  def register(*names, &block); end
  extend Forwardable
end
module TTY::Prompt::ConverterDSL
  def convert(name, input); end
  def converter(*names, &block); end
  def converter_registry; end
end
module TTY::Prompt::Converters
  def cast_to_num(num); end
  def self.cast_to_num(num); end
  extend TTY::Prompt::ConverterDSL
end
class TTY::Prompt::Result
  def errors; end
  def failure?; end
  def initialize(question, value, errors = nil); end
  def question; end
  def success?; end
  def value; end
  def with(condition = nil, &block); end
end
class TTY::Prompt::Result::Success < TTY::Prompt::Result
end
class TTY::Prompt::Result::Failure < TTY::Prompt::Result
end
class TTY::Prompt::Evaluator
  def <<(proc = nil, &block); end
  def call(initial); end
  def check(proc = nil, &block); end
  def initialize(question, &block); end
  def results; end
end
class TTY::Prompt::Question
  def call(message = nil, &block); end
  def convert(value = nil, message = nil); end
  def convert?; end
  def convert_result(value); end
  def default(value = nil); end
  def default?; end
  def echo(value = nil); end
  def echo?(value = nil); end
  def in(value = nil, message = nil); end
  def in?; end
  def initialize(prompt, **options); end
  def inspect; end
  def message; end
  def message_for(name, tokens = nil); end
  def messages; end
  def modifier; end
  def modify(*rules); end
  def process_input(question); end
  def quiet(value); end
  def raw(value = nil); end
  def raw?(value = nil); end
  def read_input(question); end
  def refresh(lines, lines_to_clear); end
  def render; end
  def render_error(errors); end
  def render_question; end
  def required(value = nil, message = nil); end
  def required?(value = nil, message = nil); end
  def to_s; end
  def validate(value = nil, message = nil, &block); end
  def validation; end
  def validation?; end
  def value(val); end
  def value?; end
  include TTY::Prompt::Question::Checks
end
class TTY::Prompt::Question::Modifier
  def apply_to(value); end
  def initialize(modifiers); end
  def modifiers; end
  def self.letter_case(mod, value); end
  def self.whitespace(mod, value); end
end
class TTY::Prompt::Question::Validation
  def call(input); end
  def coerce(pattern); end
  def initialize(pattern); end
  def pattern; end
end
module TTY::Prompt::Question::Checks
end
class TTY::Prompt::Question::Checks::CheckModifier
  def self.call(question, value); end
end
class TTY::Prompt::Question::Checks::CheckRange
  def self.call(question, value); end
  def self.cast(value); end
  def self.float?(value); end
  def self.int?(value); end
end
class TTY::Prompt::Question::Checks::CheckValidation
  def self.call(question, value); end
end
class TTY::Prompt::Question::Checks::CheckDefault
  def self.call(question, value); end
end
class TTY::Prompt::Question::Checks::CheckRequired
  def self.call(question, value); end
end
class TTY::Prompt::Question::Checks::CheckConversion
  def self.call(question, value); end
end
module TTY::Utils
  def blank?(value); end
  def deep_copy(object); end
  def extract_options!(args); end
  def extract_options(args); end
  def self.blank?(value); end
  def self.deep_copy(object); end
  def self.extract_options!(args); end
  def self.extract_options(args); end
end
class TTY::Prompt::Question::UndefinedSetting
  def inspect; end
  def to_s; end
end
class TTY::Prompt::ConfirmQuestion < TTY::Prompt::Question
  def call(message, &block); end
  def conversion; end
  def create_default_labels; end
  def create_suffix; end
  def infer_default; end
  def initialize(prompt, **options); end
  def negative(value = nil); end
  def negative?; end
  def positive(value = nil); end
  def positive?; end
  def process_input(question); end
  def render_question; end
  def setup_defaults; end
  def suffix(value = nil); end
  def suffix?; end
end
class TTY::Prompt::Error < StandardError
end
class TTY::Prompt::ConfigurationError < TTY::Prompt::Error
end
class TTY::Prompt::ConversionError < TTY::Prompt::Error
end
class TTY::Prompt::ValidationCoercion < TTY::Prompt::Error
end
class TTY::Prompt::ArgumentRequired < TTY::Prompt::Error
end
class TTY::Prompt::ArgumentValidation < TTY::Prompt::Error
end
class TTY::Prompt::InvalidArgument < TTY::Prompt::Error
end
class TTY::Prompt::ConversionAlreadyDefined < TTY::Prompt::Error
end
class TTY::Prompt::UnsupportedConversion < TTY::Prompt::Error
end
class TTY::Prompt::Choice
  def ==(other); end
  def disabled; end
  def disabled?; end
  def initialize(name, value, **options); end
  def key; end
  def name; end
  def self.convert_hash(val); end
  def self.from(val); end
  def to_s; end
  def value; end
end
class TTY::Prompt::Choices
  def <<(choice); end
  def ==(*args, &block); end
  def [](index); end
  def choices; end
  def each(&block); end
  def empty?(*args, &block); end
  def enabled; end
  def enabled_indexes; end
  def find_by(attr, value); end
  def index(*args, &block); end
  def initialize(choices = nil); end
  def length(*args, &block); end
  def pluck(name); end
  def self.[](*choices); end
  def size(*args, &block); end
  def to_ary(*args, &block); end
  def values_at(*args, &block); end
  extend Forwardable
  include Enumerable
end
class TTY::Prompt::Expander
  def answer; end
  def call(message, possibilities, &block); end
  def choice(value, &block); end
  def choices(values); end
  def collapsed?; end
  def default(value = nil); end
  def expand; end
  def expanded?; end
  def initialize(prompt, options = nil); end
  def keyenter(_); end
  def keypress(event); end
  def keyreturn(_); end
  def load_auto_hint; end
  def possible_keys; end
  def quiet(value); end
  def read_input; end
  def refresh(lines); end
  def render; end
  def render_footer; end
  def render_header; end
  def render_hint; end
  def render_menu; end
  def render_question; end
  def select_choice(key); end
  def setup_defaults; end
  def validate_choices; end
end
class TTY::Prompt::Paginator
  def check_page_size!; end
  def current_index; end
  def end_index; end
  def initialize(**options); end
  def last_index; end
  def paginate(list, active, per_page = nil, &block); end
  def reset!; end
  def start_index; end
  def start_index=(arg0); end
end
class TTY::Prompt::BlockPaginator < TTY::Prompt::Paginator
  def paginate(list, active, per_page = nil, &block); end
end
class TTY::Prompt::EnumList
  def answer; end
  def call(question, possibilities, &block); end
  def choice(*value, &block); end
  def choices(values = nil); end
  def default(default); end
  def default?; end
  def enum(value); end
  def error_message; end
  def initialize(prompt, **options); end
  def keyenter(*arg0); end
  def keyleft(*arg0); end
  def keypress(event); end
  def keyreturn(*arg0); end
  def keyright(*arg0); end
  def keytab(*arg0); end
  def mark_choice_as_active; end
  def page_help(text); end
  def page_help_message; end
  def page_size; end
  def paginated?; end
  def per_page(value); end
  def question_lines_count(question_lines); end
  def quiet(value); end
  def refresh(lines); end
  def render; end
  def render_error; end
  def render_footer; end
  def render_header; end
  def render_menu; end
  def render_page_help; end
  def render_question; end
  def setup_defaults; end
  def symbols(new_symbols = nil); end
  def validate_defaults; end
end
class TTY::Prompt::Timer
  def duration; end
  def initialize(duration, interval); end
  def interval; end
  def on_tick(&block); end
  def runtime; end
  def start; end
  def stop; end
  def time_now; end
  def total; end
  def while_remaining; end
end
class TTY::Prompt::Keypress < TTY::Prompt::Question
  def any_key?; end
  def countdown(value = nil); end
  def initialize(prompt, **options); end
  def interval_handler(time); end
  def keypress(event); end
  def process_input(question); end
  def refresh(lines, lines_to_clear); end
  def render_question; end
  def timeout?; end
end
class TTY::Prompt::List
  def answer; end
  def arrows_help; end
  def call(question, possibilities, &block); end
  def check_options_consistency(options); end
  def choice(*value, &block); end
  def choices(values = nil); end
  def default(*default_values); end
  def default_help; end
  def enum(value); end
  def enumerate?; end
  def filter_help; end
  def filterable?; end
  def help(value = nil); end
  def help_always?; end
  def help_start?; end
  def initialize(prompt, **options); end
  def keybackspace(*arg0); end
  def keydelete(*arg0); end
  def keydown(*arg0); end
  def keyenter(*arg0); end
  def keyleft(*arg0); end
  def keynum(event); end
  def keypage_down(*arg0); end
  def keypage_up(*arg0); end
  def keypress(event); end
  def keyreturn(*arg0); end
  def keyright(*arg0); end
  def keyspace(*arg0); end
  def keytab(*arg0); end
  def keyup(*arg0); end
  def page_size; end
  def paginated?; end
  def paginator; end
  def per_page(value); end
  def question_lines_count(question_lines); end
  def quiet(value); end
  def refresh(lines); end
  def render; end
  def render_header; end
  def render_menu; end
  def render_question; end
  def search_choice_in(searchable); end
  def setup_defaults; end
  def show_help(value = nil); end
  def symbols(new_symbols = nil); end
  def sync_paginators; end
  def validate_defaults; end
end
class TTY::Prompt::SelectedChoices
  def clear; end
  def delete_at(index); end
  def each(&block); end
  def find_index_by(&search); end
  def initialize(selected = nil, indexes = nil); end
  def insert(index, choice); end
  def size; end
  include Enumerable
end
class TTY::Prompt::MultiList < TTY::Prompt::List
  def answer; end
  def default_help; end
  def initialize(prompt, **options); end
  def keyctrl_a(*arg0); end
  def keyctrl_r(*arg0); end
  def keyenter(*arg0); end
  def keyreturn(*arg0); end
  def keyspace(*arg0); end
  def max(value); end
  def min(value); end
  def minmax_help; end
  def render_header; end
  def render_menu; end
  def selected_names; end
  def setup_defaults; end
end
module TTY::Prompt::Symbols
  def self.symbols; end
  def self.windows?; end
  def symbols; end
  def windows?; end
end
class TTY::Prompt::Multiline < TTY::Prompt::Question
  def help(value = nil); end
  def initialize(prompt, **options); end
  def keyenter(*arg0); end
  def keyreturn(*arg0); end
  def process_input(question); end
  def read_input; end
  def refresh(lines, lines_to_clear); end
  def render_question; end
end
class TTY::Prompt::MaskQuestion < TTY::Prompt::Question
  def initialize(prompt, **options); end
  def keyenter(event); end
  def keypress(event); end
  def keyreturn(event); end
  def mask(char = nil); end
  def read_input(question); end
  def render_error(errors); end
  def render_question; end
end
class TTY::Prompt::Slider
  def answer; end
  def call(question, &block); end
  def default(value); end
  def default_help; end
  def format(value); end
  def help(text = nil); end
  def help_always?; end
  def help_start?; end
  def initial; end
  def initialize(prompt, **options); end
  def keydown(*arg0); end
  def keyenter(*arg0); end
  def keyleft(*arg0); end
  def keyreturn(*arg0); end
  def keyright(*arg0); end
  def keyspace(*arg0); end
  def keyup(*arg0); end
  def max(value); end
  def min(value); end
  def quiet(value); end
  def range; end
  def refresh(lines); end
  def render; end
  def render_question; end
  def render_slider; end
  def show_help(value = nil); end
  def step(value); end
  def symbols(new_symbols = nil); end
end
class TTY::Prompt::Statement
  def call(message); end
  def color; end
  def initialize(prompt, newline: nil, color: nil); end
  def newline; end
end
class TTY::Prompt::Distance
  def distance(first, second); end
end
class TTY::Prompt::Suggestion
  def build_multiple_suggestions; end
  def build_single_suggestion; end
  def evaluate; end
  def indent; end
  def initialize(**options); end
  def measure_distances(message, possibilities); end
  def plural_text; end
  def single_text; end
  def suggest(message, possibilities); end
end
