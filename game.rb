require 'gosu'

class MyGame < Gosu::Window
	def initialize
		super(300, 400, false)
		@small_soldier = Player.new(self)
	end

	def update
		if button_down? Gosu::Button::KbLeft
			@small_soldier.move_left
		end

		if button_down? Gosu::Button::KbRight
			@small_soldier.move_right
		end

		if button_down? Gosu::Button::KbUp
			@small_soldier.move_up
		end

		if button_down? Gosu::Button::KbDown
			@small_soldier.move_down
		end
	end

	def draw
		@small_soldier.draw
	end
end

class Player
	def initialize(game_window)
		@game_window = game_window
		@icon = Gosu::Image.new(@game_window, "gosu/small_soldier.png", true)
		@x = 50
		@y = 50
	end

	def draw
		@icon.draw(@x,@y,1)
	end

	def move_left
	if @x < 0
	@x = 0
	else
	@x = @x - 10
	end
	end

	def move_right
		if @x > (@game_window.width - 100)
			@x = @game_window.width - 100
		else
			@x = @x + 10
		end
	end

	def move_up
		if @y < 0
			@y = 0
		else
			@y = @y - 10
		end
	end

	def move_down
		if @y > (@game_window.height - 75)
			@y = @game_window.height - 75
		else
		@y = @y + 10
		end
	end
end

window = MyGame.new
window.show