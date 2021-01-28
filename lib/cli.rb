# ruby bin/run.rb

class CommandLineInterface
#   jack of all fades, cut above, directors cut, man bun bois,
    def greet
        puts "Welcome to Man Bun Bois, the worlds number 1 source for the majestic man bun!"
        puts "Let's get started! Please select from the following options:"
        puts "1. Create a Man Bun Boi account to get started. your account will allow you to view, create, and edit your reviews of man bun artists across the continent."

        puts "2. View the Man Bun Boi directory of man bun artists with their respective reviews"
        puts "3. Update an existing Man Bun review"
        puts "4. Remove a previous review"
        puts "5. view photos of majestic man buns"
        puts "6. Exit"
        user_input = gets.chomp
        self.response(user_input) #name issue here also
    end
    def response(user_input) #this needs to be renamed  response handler
        case(user_input)
        when "1"
            puts "Enter your name to add to the Cut above directory:"
            create_customer
            puts "Thank you for your interest in Cut Above. Your name has been added to the directory. you are ready to go!"
        when "2"
            puts "Welcome, here's our catalog! This includes the barber's name, a brief description about their experience, and rating (1 - 10) given by other Cut Above users."
            self.view_reviews
        when "3"
      
        when "4"
         
        when "5"
            puts "Wow, just got a new cut! Sorry for the low-res photo! feel as majestic as a pack of tigers."
            puts self.majestic_man_bun
         
    
        else
            puts "Press * to confirm."
            ex = gets.chomp
            self.exit
        
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
        score.update(name: "#{upd_input_new_rating}")
        self.return_to_menu
    end

    def delete(reveiw)
        r1 = Review.find_by(name: "#{review}")
        r1.destroy
        self.return_to_menu
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

