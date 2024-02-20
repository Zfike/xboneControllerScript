class Interpreter

    def initialize
        @stack = []
        @code = []
        @pc = 0
        @output_buffer = []
    end

    def load_from_file(file_name)
        if File.exist?(file_name)
            begin
                File.open(file_name, 'r') do |file|
                    file.each_line do |line|
                        @code << line.chomp
                    end
                end
            rescue => e
                puts "error loading file: #{e.message}"
            end
        else
            puts "File not found: #{file_name}"
        end
    end

    def interpret
        @output_buffer = ""
        while @pc < @code.length
        instruction = @code[@pc]
        # puts "executing instruction: #{instruction}"
        execute(instruction)
        break if instruction == "START BUTTON"
        @pc += 1



        end
    end

    # helper function for DPAD UP n
    def interpret_dpad_up(n)
        if @stack.empty?
          raise "Error: Stack is empty"
        end
        
        top_value = @stack.pop
        if top_value == 0
          @pc = n
        end
    end

    def execute(instruction)
        # puts "executing instruction: #{instruction}"
        # puts "Top of stack: #{@stack[-1]}" if @stack.any?
        
        case instruction
        when 'A BUTTON'
            @stack.append(0)
        when 'X BUTTON'
            if @stack.empty?
                puts "Error: Stack is empty."
            else
                value = @stack.last
                @stack.push(value)
            end
        when 'RIGHT TRIGGER'
            if @stack.empty?
                puts "Error: Stack is empty."
            else
                @stack[-1] += 1
            end
        when 'LEFT TRIGGER'
            if @stack.length < 2
                puts "Error: Stack has less than 2 values."
            else
                a = @stack.pop
                b = @stack.pop
                @stack.push(b - a)
            end
        when 'TURBO BUTTON'
            if @stack.length >= 2
                a = @stack.pop.chr.to_i
                b = @stack.pop.chr.to_i
                result = a * b
                @stack.push(result)
            else
                raise "Error: Insufficient values on the stack for subtraction"
            end
        when 'Y BUTTON'
            puts "enter character"
            character = $stdin.gets
            @stack.push(character.ord)
        when 'RIGHT BUMPER'
            character = @stack.pop
            @output_buffer << character.chr if character
        when 'LEFT BUMPER'
            puts @stack.pop if @stack.any?
        when /^DPAD UP (\d+)$/
            n = $1.to_i
            if @stack.empty?
              puts "Error: Cannot perform jump. Stack is empty."
            else
              top = @stack.pop
              if top == 0
                @pc = n - 1 if n.between?(1, @code.length) # Adjust pc to jump to the nth line
              end
            end
        when 'B BUTTON'
            if @stack.empty?
                puts "Error: Stack is empty."
            else
                value = @stack.pop
                @stack.unshift(value)
            end
        when 'DPAD DOWN'
            if @stack.empty?
                puts "Error: Stack is empty."
            else
                value = @stack.shift # Shift removes the first element of the array
                @stack.push(value)
            end
        when 'DPAD LEFT'
            puts "Enter a string"
            input_string = gets.chomp
            reverse_string = input_string.reverse
            reverse_string.each_char { |c| @output_buffer << c }
        when 'START BUTTON'
            puts @output_buffer
            return
        end
    end
end

interpreter = Interpreter.new
interpreter.load_from_file('reverse.xbos')
interpreter.interpret
