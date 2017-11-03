require "./card"

class CardOutlines

    def convert(value)
        val = ""

        case value
            when 1
                val = " A"
            when 11
                val = " J"
            when 12
                val = " Q"
            when 13
                val = " K"
            when 10
                val = "10"
            else
                val = " #{value}"
        end

        return val
    end

    def hearts(val)
        val = convert(val)

        return [
            " ____________", 
            "|            |", 
            "| #{val}         |", 
            "|    _  _    |", 
            "|   \\ \\/ /   |", 
            "|    \\  /    |", 
            "|     \\\/     |", 
            "|            |", 
            "|        #{val}  |", 
            "|____________|"
        ]
    end

    def clubs(val)
        val = convert(val)

        return [
            " ____________", 
            "|            |", 
            "| #{val}         |", 
            "|            |", 
            "|    _()_    |", 
            "|   (_  _)   |", 
            "|     ||     |", 
            "|            |", 
            "|        #{val}  |", 
            "|____________|"]
    end

    def diamonds(val)
        val = convert(val)

        return [
            "  ____________", 
            "|            |", 
            "| #{val}         |", 
            "|     /\\     |", 
            "|    /  \\    |", 
            "|    \\  /    |", 
            "|     \\/     |", 
            "|            |", 
            "|        #{val}  |", 
            "|____________|"]
    end

    def spades(val)
        val = convert(val)

        return [
            " ____________", 
            "|            |", 
            "| #{val}         |", 
            "|            |", 
            "|    _/\\_    |", 
            "|   (_  _)   |", 
            "|     ||     |", 
            "|            |", 
            "|        #{val}  |", 
            "|____________|"]
    end

end



module CardPrinter
    def CardPrinter.print_card(c1)
        co = CardOutlines.new
        puts "   Your card"
        puts co.send(c1.suit.downcase, c1.value)
    end
    def CardPrinter.print_cards(c1, c2)
        co = CardOutlines.new
        card1_array = co.send(c1.suit.downcase, c1.value)
        card2_array = co.send(c2.suit.downcase, c2.value)

        puts "   Your card        Your opponents card"
        (1..10).each_with_index do |line, i|
            
                puts "#{card1_array[i]}        #{card2_array[i]}"
            
        end
    end
end


