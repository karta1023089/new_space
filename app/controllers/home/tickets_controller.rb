class Home::TicketsController < HomeController
	def index
		@tickets = Ticket.all
	end
	def show
	end
end
