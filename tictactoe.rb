require 'pry'
require 'tty-prompt'

def clear_screen
    if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
        system('cls')
    else
        system('clear')
    end
end

def game_initialize
    prompt = TTY::Prompt.new
    clear_screen()
    puts "Welcome to Tic-Tac-Toe where you need to get 3 in a row!"
    puts
    puts "Would you like to be X or O ? "
    player_symbol = prompt.select("Choose which symbol you want to be:", %w(X O Quit))
    if player_symbol == 'Quit'
        clear_screen()
        exit
    end
end




game_initialize()