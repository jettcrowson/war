require "io/console"

module Keypress
    def Keypress.wait
        STDIN.getch
    end
end
