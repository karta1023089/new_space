class Home::TicketsController < HomeController
	def index
		@tickets = Ticket.all
		@the_group = @tickets.pluck(:the_group).uniq
	end
	def show
		@ticket = Ticket.find(params[:id])
		@sugg = Ticket.where.not(:id => @ticket.id).where(:the_group => @sugg.the_group)
	end
end
