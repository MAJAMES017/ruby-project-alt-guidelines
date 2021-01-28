# ruby bin/run.rb

class CommandLineInterface
#   jack of all fades, cut above, directors cut, man bun bois,
    def greet

        puts "
        █▄─▀█▀─▄██▀▄─██▄─▀█▄─▄███▄─▄─▀█▄─██─▄█▄─▀█▄─▄███▄─▄─▀█─▄▄─█▄─▄█─▄▄▄▄█
        ██─█▄█─███─▀─███─█▄▀─█████─▄─▀██─██─███─█▄▀─█████─▄─▀█─██─██─██▄▄▄▄─█
        ▀▄▄▄▀▄▄▄▀▄▄▀▄▄▀▄▄▄▀▀▄▄▀▀▀▄▄▄▄▀▀▀▄▄▄▄▀▀▄▄▄▀▀▄▄▀▀▀▄▄▄▄▀▀▄▄▄▄▀▄▄▄▀▄▄▄▄▄▀
                        a subsidiary of prestige worldwide
        "

        puts "Welcome to Man Bun Bois, the worlds number 1 source for the majestic man bun!"
        puts "To get this party started! Please select from the following:"

        puts "1. Create a Man Bun Boi account to get initiated into the fraternity of the bun. Your account will allow you to view, create, and edit your reviews of man bun artists across the continent."

        puts "2. View the Man Bun Boi review database of some of the most prestegious man bun artists."

        puts "3. Changed your mind? Update an existing Man Bun review."

        puts "4. Need to get rid of the evidence? Remove a previous review."

        puts "5. View today's top photo of a majestic man bun!"

        puts "6. Catch you on the flip side! (exit)"
        user_input = gets.chomp
        self.response_handler(user_input) #name issue here also
    end
    def response_handler(user_input) #this needs to be renamed  response handler
        case(user_input)
        when "1"
            puts "Enter your name to add to the Cut above directory:"
            create_customer
            puts "Thank you for your interest in Cut Above. Your name has been added to the directory. you are ready to go!"

        when "2"
            puts "Welcome, here's our catalog! This includes the barber's name, a brief description about their experience, and rating (1 - 10) given by other Cut Above users."
            self.view_reviews

        when "3"
            self.update_review_rating
            puts "Heck ya! The review has been updated."
      
        when "4"
            puts "Do not fret, we all make mistakes! Which would you like to remove?"
            review_input = gets.chomp
            self.delete(review_input)
            puts " POOF! #{review_input} has been removed. It's like it was never there!"
         
        when "5"
            puts Date.today
            puts self.print_customer_name
            puts "Wow, just got a new cut! I feel as majestic as a kaleidoscope of Glasswing butterflies."
            puts self.majestic_man_bun
            self.return_to_main

        when "6" 
            puts "WE HAD NO TIME TO SAY GOODBYE!"
            puts "Press ENTER to confirm."
            ex = gets.chomp
            self.exit_app
            puts "see ya later alligator"
            
         
        else
            puts "Hmm, we seem to have a rebel on our hands."
            puts "You have been exiled from the Man Bun Bois."
            puts "press ENTER to claim your fate"
            ex = gets.chomp
            self.exit_app
        
        end
            
    end


    def return_to_main
        puts "To return to the main menu and make another selection, please press enter."
        gets.chomp
        self.greet
    end

    def create_customer
        customer = gets.chomp
        c1 = Customer.new(name: "#{customer}")
        c1.save
        self.return_to_main
    end

    def rtn_rand_customer
        Customer.all.sample.name
    end

    def print_customer_name
        puts "todays photo is from man bun enthusuast #{rtn_rand_customer}"
    end

    def view_reviews
        Review.all.each do |review|
            puts "name: #{review.name}"
            puts "description: #{review.description}"
            puts "rating: #{review.rating}"
            # puts "id? i dont think that these need to be displayed"
        end
        self.return_to_main
    end

    def update_review_rating
        puts "Please enter the name of the review that you are looking for:"
        upd_input = gets.chomp
        score = Review.find_by(name: "#{upd_input}")
        puts "Please enter the new rating for the review that you are updating:"
        upd_input_new_rating = gets.chomp
        score.update(rating: "#{upd_input_new_rating}")
        puts "A shiney new rating has been given. Nice... unless it was a lower rating."
        self.return_to_main
    end

    def delete(review)
        r1 = Review.find_by(name: "#{review}")
        r1.destroy
        self.return_to_menu
    end

    def exit_app
        # is there a way to close out of the terminal
    end


    def majestic_man_bun
        puts "        ───────────────────███──────────
        ───────────────██████████───────
        ──────────────████████████──────
        ──────────────██────────██──────
        ──────────────██▄▄▄▄▄▄▄▄▄█──────
        ──────────────██▀███─███▀█──────
        █─────────────▀█────────█▀──────
        ██──────────────────█───────────
        ─█──────────────██──────────────
        █▄────────────████─██──████
        ─▄███████████████──██──██████ ──
        ────█████████████──██──█████████
        ─────────────████──██─█████──███
        ──────────────███──██─█████──███
        ──────────────███─────█████████
        ──────────────██─────████████▀
        ────────────────██████████
        ────────────────██████████
        ─────────────────████████
        ──────────────────██████████▄▄
        ────────────────────█████████▀
        ─────────────────────████──███
        ────────────────────▄████▄──██
        ────────────────────██████───▀
        ────────────────────▀▄▄▄▄▀
        "
    end
    

end    

