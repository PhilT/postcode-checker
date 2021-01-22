# frozen_string_literal: true

def load_whitelist
  File.read(Rails.root.join('config/whitelist.txt')).split("\n")
end

Whitelist = load_whitelist
