class IyeStore
  include Transformation

  attr_accessor :categories, :keys, :translations, :locales

  def initialize
    @categories = {}
    @keys = {}
    @translations = {}
    @locales = Set.new
  end

  def add_translation translation
    if existing = self.translations[translation.name]
      message = "#{translation.name} detected in #{translation.file} and #{existing.file}"
      #raise DuplicateTranslationError.new(message)
    end

    self.translations[translation.name] = translation

    add_locale(translation.locale)

    key = (self.keys[translation.key] ||= IyeKey.new(name: translation.key))
    key.add_translation(translation)

    category = (self.categories[key.category] ||= IyeCategory.new(name: key.category))
    category.add_key(key)
  end

  def add_key key
    self.keys[key.name] = key
  end

  def add_locale locale
    self.locales.add(locale)
  end

  def filter_keys options={}
    filters = []
    if options.has_key?(:key)
      filters << lambda {|k| k.name =~ options[:key]} 
    end
    if options.has_key?(:complete)
      filters << lambda {|k| k.complete? == options[:complete]}
    end
    if options.has_key?(:empty)
      filters << lambda {|k| k.empty? == options[:empty]}
    end
    if options.has_key?(:text)
      filters << lambda {|k|
        k.translations.any? {|t| t.text =~ options[:text]}
      }
    end

    self.keys.select {|name, key|
      filters.all? {|filter| filter.call(key)}
    }
  end

  def create_missing_keys
    self.keys.each {|name, key|
      missing_locales = self.locales - key.translations.map(&:locale)
      missing_locales.each {|locale|
        translation = key.translations.first

        # this just replaces the locale part of the file name. should
        # be possible to do in a simpler way. gsub, baby.
        path = Pathname.new(translation.file)
        dirs, file = path.split
        file = file.to_s.split(".")
        file[-2] = locale
        file = file.join(".")
        path = dirs.join(file).to_s

        new_translation = IyeTranslation.new(name: "#{locale}.#{key.name}", file: path)
        add_translation(new_translation)
      }
    }
  end

  def from_yaml yaml, file=nil
    translations = flatten_hash(yaml)
    translations.each {|name, text|
      translation = IyeTranslation.new(name: name, text: text, file: file)
      add_translation(translation)
    }
  end

  def to_yaml
    result = {}
    files = self.translations.values.group_by(&:file)
    files.each {|file, translations|
      file_result = {}
      translations.each {|translation|
        file_result[translation.name] = translation.text
      }
      result[file] = nest_hash(file_result)
    }
    result
  end
end