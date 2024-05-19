function nvai --wraps='HTTPS_PROXY=http://localhost:11435 nvim' --description 'alias nvai HTTPS_PROXY=http://localhost:11435 nvim'
  HTTPS_PROXY=http://localhost:11435 nvim $argv
        
end
