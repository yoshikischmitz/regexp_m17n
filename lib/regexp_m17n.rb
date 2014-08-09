module RegexpM17N
  def self.non_empty?(str)
    if str.encoding.dummy?
      # Convert through pairs of compatible encodings until we reach UTF-8
      Encoding::Converter.search_convpath(str.encoding, "UTF-8").each do |e|
        2.times{ str.encode!(e.shift) }
      end
    end
    str =~ Regexp.new('^.+$'.encode(str.encoding))
  end
end
