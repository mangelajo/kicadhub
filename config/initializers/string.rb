class String

  def chunk(size)
    self.scan(/.{1,#{size}}/)
  end

  def chunked(size,sep=' ')
    strings = self.split(sep)

    if strings.length>1 then
      strings_final=[]
      strings.each do |str|
        strings_final.append(str.chunked(size,sep))
      end
      return strings_final.join(sep)
    else
      chunks = self.chunk(size)
      return chunks.join(sep)
    end
  end

  def trimall!(char_list=[" ","\n","\r"])

    while char_list.include? self[0]
      self.ltrim! self[0]
    end

    while char_list.include? self[length-1]
      self.rtrim! self[length-1]
    end

  end

  def trimall(char_list=[" ","\n","\r"])
    str = String.new(self)
    while char_list.include? str[0]
      str = str.ltrim str[0]
    end

    while char_list.include? str[str.length-1]
      str = str.rtrim str[str.length-1]
    end

    return str
  end

  def rtrim(char)
    String.new(self).rtrim!(char)
  end

  def rtrim!(char)
    gsub!(/#{Regexp.escape(char)}+$/, '')
  end

  def ltrim(char)
    String.new(self).ltrim!(char)
  end

  def ltrim!(char)
    gsub!(/^#{Regexp.escape(char)}+/, '')
  end
end