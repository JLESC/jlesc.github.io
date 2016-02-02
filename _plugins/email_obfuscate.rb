module Jekyll
  module ObfuscateEmailFilter
    def obfuscate_email(input)
      input.strip!
      input.reverse!
    end
  end
end

Liquid::Template.register_filter(Jekyll::ObfuscateEmailFilter)
