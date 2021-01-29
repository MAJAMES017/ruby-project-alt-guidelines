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

        puts "1. Create a Man Bun Boi account to get initiated into the fraternity of The Bun. Your account will allow you to view, create, and edit your reviews of man bun artists across the continent."

        puts "2. View the Man Bun Boi review database of some of the most prestigious man bun artists."

        puts "3. Create a shiney new review, so the world can hear your tale"

        puts "4. Have things changed? Update an existing Man Bun review rating."

        puts "5. Need to get rid of the evidence? Remove a previous review."

        puts "6. View today's top photo of a majestic man bun!"

        puts "7. Catch you on the flip side! (exit)"
        user_input = gets.chomp
        self.response_handler(user_input) #name issue here also
    end
    def response_handler(user_input) #this needs to be renamed  response handler
        case(user_input)
        when "1"
            puts "Enter your name and location to add to the Man Bun Boi directory:"
            puts "You can enter your info in this format: Name, location. Hit ENTER after each input."
            self.create_customer
            puts "Thank you for your interest in joining the world's bes man bun community. Your name has been added to the directory. you are ready to go!"
            # this line prints at the end when you exit

        when "2"
            puts "Welcome, here's our catalog! This includes the barber's id, a brief description about their experience, and rating (1 - 10) given by other MBB users."
            self.view_reviews

        when "3"
            puts "You can enter your review in this format: Title, Description, rating(1-10). Hit ENTER after each input. "
            self.create_review

        when "4"
            self.update_review_rating
            #  puts "Heck ya! The review has been updated."
            # this line also prints at the ends after you exit
      
        when "5"
            puts "Do not fret, we all make mistakes! Which would you like to remove?"
            review_input = gets.chomp
            self.delete(review_input)
            puts " POOF! #{review_input} has been removed. It's like it was never there!"
            # another late message
        
         
        when "6"
            puts Date.today
            puts self.print_customer_name
            puts "Wow, just got a new cut! I feel as majestic as a kaleidoscope of Glasswing butterflies."
            puts self.majestic_man_bun
            self.return_to_main

        when "7" 
            puts "WE HAD NO TIME TO SAY GOODBYE!"
            puts "Press ENTER to confirm."
            ex = gets.chomp
            # self.exit_app
            puts "see ya later alligator"
            
         
        else
            puts "Hmm, we seem to have a rebelious type on our hands."
            puts "You have been exiled from the Man Bun Bois."
            puts "press ENTER to claim your fate"
            ex = gets.chomp
            # self.exit_app
        
        end
            
    end


    def return_to_main
        puts "To return to the main menu and make another selection, please press enter."
        gets.chomp
        self.greet
    end

    def create_customer
        customer_name = gets.chomp
        customer_location = gets.chomp
        c = Customer.create(name: "#{customer_name}", location: "#{customer_location}")
        self.return_to_main
    end

    def create_review
        review_name = gets.chomp
        review_desc = gets.chomp
        review_rating = gets.chomp
        r = Review.create(name: "#{review_name}", description: "#{review_desc}", rating: "#{review_rating}", customer: Customer.last, barber: Barber.all.sample)

        self.return_to_main
    end
    
    
    def rand_review
        Review.all.sample
        
    end
  
    def rtn_rand_review 
        puts "Like an arcade claw game, but with none of the control over your prize"
        puts "OOOOOOOH THE CLAWWWWWW!"
        puts "#{rand_review} has been chosen"
        self.return_to_main
        # this does not return all the info just the review id
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
        puts "A shiney new rating has been given. Nice... unless it was a lower rating, then not so nice."
        self.return_to_main
    end

    def delete(review)
        r1 = Review.find_by(name: review)
        r1.destroy
        puts "it's done. you can fogetabotit."
    
        self.return_to_main
        
    end

    # def exit_app
    # #    this doesnt do anything but it apears that it smoothly closes the applicaton. need to test.
    # end


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

